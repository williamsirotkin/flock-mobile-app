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
        Text(" "),
      Center(child: Text("Recommended Trips For You", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
      Text(" "),
      FindTripWidget(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2H1KpVSMQJmFR_5Qckrs-H_7P8AdUXTNRIA&usqp=CAU", location: "       Atlanta, USA       ", dates: "      July 1st - July 7th"),
      Text(" "),
            FindTripWidget(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGP7_m7v1A7krb8VWWrNRVKQI_47ayVH1isg&usqp=CAU", location: "San Fransisco, USA", dates: "June 1st - June 9th"),
      Text(" "),
            FindTripWidget(image: "https://upload.wikimedia.org/wikipedia/commons/a/a0/Sydney_Australia._%2821339175489%29.jpg", location: "  Sydney, Australia   ", dates: "August 1st - August 5th"),
      Text(" "),
      Text(" "),
      Text(" "),
      Text(" "),
      Text(" "),
      Text(" "),
      Text(" "),
      ],
    );
  }
}