import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Widgets/MenuProvider.dart';
import './TripPage.dart';
import '../Widgets/MyTripWidget.dart';
import '../Widgets/MenuProvider.dart';
import './CreateTrip.dart';

class MyTripsPage extends StatelessWidget {
  var user;
  MyTripsPage({this.user});
  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MyAppState>();

    return ListView(
      shrinkWrap: true,
      children: [
        Text("  "),
         Row (
            children: [
              Center(
            child: Text("                     My Trips",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
                Text("      "),
        ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                )),
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 44, 177, 66)),
                padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 14, color: Colors.white))),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MenuProvider(
                      page: CreateTripPage(user: user), user: user)));
            },
            child: const Text('Create Trip +', style: TextStyle(fontSize: 18)),
        ),
                ]
          ),
        Text(' '),
        MyTripWidget(),
        Text(" "),
        MyTripWidget(),
        Text(" "),
        MyTripWidget(),
        Text(" "),
        MyTripWidget(),
         Text(" "),
        MyTripWidget(),
      ],
    );
  }
}
