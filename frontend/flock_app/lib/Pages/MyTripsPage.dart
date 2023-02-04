import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Widgets/MenuProvider.dart';
import './TripPage.dart';
import '../Widgets/MyTripWidget.dart';

class MyTripsPage extends StatelessWidget {
  var user;
  MyTripsPage({this.user});
  @override
  Widget build(BuildContext context) {
   // var appState = context.watch<MyAppState>();

    return ListView(
      shrinkWrap: true,
      children: [
        Center(child: Text("My Trips")),
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