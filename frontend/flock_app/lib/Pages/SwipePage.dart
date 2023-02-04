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
            Image.network("https://e0.pxfuel.com/wallpapers/920/682/desktop-wallpaper-high-resolution-michael-scott-lujayn-colebourn-michael-scott-the-office.jpg", fit: BoxFit.cover, height: 510),
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
          Text(snapshot.data!.firstName + " " + snapshot.data!.lastName, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
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
              Text("📍" + snapshot.data!.city + ", " + snapshot.data!.country, style: TextStyle(fontSize: 20)),
              Text(snapshot.data!.bio, style: TextStyle(fontSize: 20)),
              Row (children: [
                Image(image: AssetImage('assets/images/jim-rating.png')),
              ]
              ),
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