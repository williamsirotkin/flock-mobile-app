import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Widgets/MenuProvider.dart';


class SafetyPage extends StatelessWidget {
  var user;
  SafetyPage({this.user});
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Center(child: Text("Our Pledge To Your Safety", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
        Text(" "),
        Text(" "),
        Center(child: Text(" Your safety when travelling using our application is our top priority. We have multiple built in safety features as well as safety recommendations to keep you safe.")),
        Text(" "),
        Text(" 1) We plan to verify all trip participants' identity before they leave, to run background checks and ensure the safety of all participants."),
        Text(" "),
        Text(" 2) Your shared trip itnerary is open to everyone in the group. This itinerary keeps an organized, paper trail of destinations, and allows for easier hiring of Security, Tour Guides, and Trip planners while travelling."),
        Text(" "),
        Text(" 3) Go on trips with people with lniked social medias, good ratings, and mutual friends."),
        Text(" "),
        Text(" 4) We recommend you don't travel alone. We have lots of faith in our security, but travelling alone can still be dangerous."),
        Text(" "),
        Text(" 5) Keep an eye out for people planning to travel in your group. Try to talk to everyone in the trip Group Chat, and vote to kick people out if they cause a hassle. ")
      ],
    );
  }
}