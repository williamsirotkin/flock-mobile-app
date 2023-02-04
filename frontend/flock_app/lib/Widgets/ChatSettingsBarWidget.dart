import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'MenuProvider.dart';
import '../Pages/ItineraryPage.dart';

class ChatSettingsBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // var appState = context.watch<MyAppState>();

    return Row (children: [
      TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {},
            child: const Text('Requests'),
          ),
      Text("     "),
      TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: ItineraryPage(dayAndNight: "Day", numberDay: 1))));},
            child: const Text('Itinerary'),
          ),
      Text("     "),
      TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {},
            child: const Text('Chat Settings'),
          ),
    ],);
  }
}