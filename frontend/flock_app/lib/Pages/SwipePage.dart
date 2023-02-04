import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'package:swipe/swipe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/Person.dart';
import '../Widgets/MenuProvider.dart';
import '../Models/Usernames.dart';
import '../Calls/FetchUsernameCall.dart';
import '../Calls/LikeCall.dart';
import '../Calls/HateCall.dart';
enum UserFacing {
  art,
  drinking,
  gym,
  nightlife,
  learning,
  coffee,
  outdoors,
  gambling,
  shopping,
  hiking,
  museums,
  wildlife,
  aviation,
  biking
}

final entries = {
  'art': 'art_gallery',
  'drinking': 'bar',
  'gym': 'gym',
  'nightlife': 'night_club',
  'learning': 'library',
  'coffee': 'cafe',
  'outdoors': 'campground',
  'gambling': 'casino',
  'shopping': 'shopping_mall',
  'hiking': 'park',
  'museums': 'museum',
  'wildlife': 'zoo',
  'aviation': 'airport',
  'biking': 'bicycle_store',
};

class SwipePage extends StatelessWidget {
  var username, user;
  SwipePage({this.username, this.user});
  late Future<Person> futurePerson;
  //late Future<Usernames> futureUsername;

   @override
  Widget build(BuildContext context) {
    Future<Person> fetchPerson() async {
  final response = await http
      .get(Uri.parse('http://127.0.0.1:5000/profile/get/' + await username));
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.
          print(jsonDecode(response.body));
          return Person.fromJson(jsonDecode(response.body));
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          throw Exception('Failed to load person');
        }
      }


    return ListView(
      shrinkWrap: true,
      children: [
        Swipe(child: 
            Image.network("https://e0.pxfuel.com/wallpapers/920/682/desktop-wallpaper-high-resolution-michael-scott-lujayn-colebourn-michael-scott-the-office.jpg", fit: BoxFit.cover, height: 430),
        onSwipeLeft: () {
          print("Swiped Left");
          hate(Future.value(user), Future.value(username));
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: SwipePage(username: fetchUsername(), user: user), user: user)));
  },
  onSwipeRight: () async {
    print(user);
    like(Future.value(user),Future.value(username));
  
    /*
    FutureBuilder<Usernames>(
        future: fetchUsername(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("hello world");
            print("snapshot.hasData");
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: SwipePage(username: snapshot.data!.username))));
          } else {
            print("WRONG");
          }
          return Text('Hi');
        },
    );
    */
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: SwipePage(username: fetchUsername(), user: user), user: user)));
  },
  ),
      FutureBuilder<Person>(
        future: fetchPerson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column (children: [
               Row (
        children: [
          Text(" "),
          Text(snapshot.data!.firstName + " " + snapshot.data!.lastName, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
          Text("  "),
          ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(55.0),
    )
  ),
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 15, color: Colors.white))),
                onPressed: () {

                },
                child: const Text('Add Friend + ')),
        ]
      ),
              Row(children: [Text("📍" + snapshot.data!.city + ", " + snapshot.data!.country, style: TextStyle(fontSize: 20)), Text(" ")]),
              Text(" "),
              Row(children: [Text(" "), Text(snapshot.data!.bio, style: TextStyle(fontSize: 20))]),
              Text(" "),
              Row (children: [Text(" "), Image(image: AssetImage('assets/images/instagram.png'), height: 30), Text(" "), TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {print("See social media page");},
            child: const Text('Instagram'),
          ),Text("  "), Image(image: AssetImage('assets/images/facebook.png'), height: 30), TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {print("See social media page");},
            child: const Text('Facebook'),
          ),
           ],
           ),
          Text(" "),
          Row(children: [Text("  My Interests... "), Text(" ")]),
          Wrap (
            spacing: 5.0,
            children: UserFacing.values.map((UserFacing interest) {
                    return getValue(FilterChip(
                    label: Text(interest.name),
                    backgroundColor: Colors.blue,
                    onSelected: (bool value) {
                    },
                  ), snapshot.data!, interest);
              //  } 
              //  }
            }).toList(),
          ),
              Row (children: [
                Text("        "),
                Image(image: AssetImage('assets/images/jim-rating.png'),height: 130),
                Text("      "),
              ],
              ),
              Row (children: [
                Text("         "),
                Image(image: AssetImage('assets/images/kramer-rating.png'),height: 135),
                Text("      "),
              ],
              )
            ]
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ), 
      ]
    );
  }
  }

  Widget getValue(chip, data, interest) {
    for (int i = 0; i < data.interests.length; i++) {
      print(data.interests[i].toLowerCase());
        if (entries[interest.toString().substring(11)].toString().toLowerCase() == data.interests[i].toLowerCase()) {
          return chip;
        }
            }
            return Text("");
  }