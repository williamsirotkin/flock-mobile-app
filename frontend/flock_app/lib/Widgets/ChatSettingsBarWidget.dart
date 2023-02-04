import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

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
            onPressed: () {},
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