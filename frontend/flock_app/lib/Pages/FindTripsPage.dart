import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Widgets/MenuProvider.dart';
import '../Widgets/FindTripWidget.dart';
import './TripDetailsPage.dart';

class FindTripsPage extends StatelessWidget {
  var user;
  FindTripsPage({this.user});
  @override
  Widget build(BuildContext context) {

    return ListView(
      shrinkWrap: true,
      children: [
      Center(child: Text("Recommended Trips")),
      Text(" "),
      FindTripWidget(),
      Text(" "),
      FindTripWidget(),
      Text(" "),
      FindTripWidget(),
      ],
    );
  }
}