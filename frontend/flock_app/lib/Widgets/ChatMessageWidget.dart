import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class ChatMessageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // var appState = context.watch<MyAppState>();

    return ListView(
      shrinkWrap: true,
      children: [
        Row (
          children: [
            Container (
              color: Colors.green,
              height: 50,
        child: ClipRRect (
          borderRadius: BorderRadius.circular(25),
          child: Text("Message Goes Here", style: TextStyle(fontSize: 15))
        ),
        ),
        Text("        "),
          ]
        ),
      ],
    );
  }
}