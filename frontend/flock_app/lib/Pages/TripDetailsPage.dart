import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Widgets/BackButtonWidget.dart';
import './FindTripsPage.dart';
import '../Widgets/SuggestedPlaceWidget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/Trip.dart';

class TripDetailsPage extends StatelessWidget {
  var user;
  TripDetailsPage({this.user});

  late Future<Trip> futureTrip;

  @override
  Widget build(BuildContext context) {
    futureTrip = fetchTrip();
    print(futureTrip);

    return FutureBuilder<Trip>(
      future: futureTrip,
      builder: (context, snapshot) {
        //print("apparently null: " + snapshot.data!.name);
        //String name = snapshot.data!.name;
        //String destination = snapshot.data!.destination;
        //String description = snapshot.data!.description;

        if (snapshot.hasData) {
          return Scaffold(
              body: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Text(""),
              Container(
                  height: 50,
                  child: Center(
                      child: Text(
                    "Trip Name: " + snapshot.data!.name,
                    style: TextStyle(fontSize: 40),
                  ))),
              Text(" "),
              Container(
                height: 50,
                color: Colors.blue[200],
                child: Center(
                    child: Text("Destination: " + snapshot.data!.destination)),
              ),
              Text(" "),
              Container(
                height: 50,
                color: Colors.blue[200],
                child: Center(
                    child: Text("Description: " + snapshot.data!.description)),
              ),
              Text(" "),
              Container(
                height: 50,
                color: Colors.blue[200],
                child: Center(
                    child: Text(
                        "Max Number of People: " + snapshot.data!.max_number)),
              ),
              Text(" "),
              Container(
                height: 50,
                color: Colors.blue[200],
                child: Center(
                    child: Text("Current Number of People: " +
                        snapshot.data!.current_number)),
              ),
              Text(" "),
              Container(
                height: 50,
                color: Colors.blue[200],
                child: Center(
                    child: Text("Group Leader: " + snapshot.data!.leader)),
              ),
              Text(" "),
              Container(
                height: 50,
                color: Colors.blue[200],
                child: Center(
                    child:
                        Text("Requirements: " + snapshot.data!.requirements)),
              ),
              Text(" "),
              Container(
                height: 50,
                color: Colors.blue[200],
                child: Center(
                    child: Text(
                        "Estimated Cost: " + snapshot.data!.estimated_cost)),
              ),
              Text(" "),
              Container(
                height: 50,
                color: Colors.blue[200],
                child: Center(
                    child: Text("Start Date: " + snapshot.data!.start_date)),
              ),
              Text(" "),
              Container(
                height: 50,
                color: Colors.blue[200],
                child:
                    Center(child: Text("End Date: " + snapshot.data!.end_date)),
              ),
            ],
          ));
        } else {
          return Text('not getting the data');
        }
      },
    );
  }

  Future<Trip> fetchTrip() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:5000/trip/get/Test'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Trip.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  /*Future<Map<String, dynamic>> fetchTrip() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:5000/trip/get/Test'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> jsonStuff = jsonDecode(response.body);
      //print(jsonStuff);
      return jsonStuff;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load trip');
    }
  }*/
}
