import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'package:swipe/swipe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/Person.dart';

class SwipePage extends StatelessWidget {
  late Future<Person> futurePerson;

   @override
  Widget build(BuildContext context) {
   // var appState = context.watch<MyAppState>();
    Future<Person> fetchPerson() async {
  final response = await http
      .get(Uri.parse('http://127.0.0.1:5000/profile/get/stephennemeth4'));
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
        Swipe(child: Image.network("https://e0.pxfuel.com/wallpapers/920/682/desktop-wallpaper-high-resolution-michael-scott-lujayn-colebourn-michael-scott-the-office.jpg", fit: BoxFit.cover, height: 440),
        onSwipeLeft: () {
          print("Swiped Left");
  },
  onSwipeRight: () {
    print("Swiped Right");
  },),
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
              Text(snapshot.data!.city, style: TextStyle(fontSize: 20)),
              Text(snapshot.data!.country, style: TextStyle(fontSize: 20)),
              Text(snapshot.data!.bio, style: TextStyle(fontSize: 20)),
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