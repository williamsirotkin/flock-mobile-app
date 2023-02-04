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
        SizedBox(
            height: 30,
          child: Container (
          color: Colors.green,
          child: 
            Text("Message Goes Here")
          )
        ),
        Text("        "),
          ]
        ),
      ],
    );
  }
}