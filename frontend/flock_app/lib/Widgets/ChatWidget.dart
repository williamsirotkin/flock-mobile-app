import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import './ChatMessageWidget.dart';

class ChatWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Center(child: Text("Los Pollos Hermanos", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        Text(" "),
        Image(image: AssetImage('assets/images/GroupChat.png')),
        Text(" "),
        TextField(
  obscureText: false,
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: '',
  ),
),
    Text(" "),
    Text(" "),
    Text(" "),
    Text(" "),
    Text(" "),
      ],
    );
  }
}