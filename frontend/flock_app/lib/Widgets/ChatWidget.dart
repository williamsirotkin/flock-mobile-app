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
        Text(" "),
        Text(" "),
        Text(" "),
        Center(child: Text("Group Chat (Can be renamed)", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        Text(" "),
        Text(" "),
        Text(" "),
        Text(" "),
        ChatMessageWidget(),
        Text(" "),
        ChatMessageWidget(),
        Text(" "),
        ChatMessageWidget(),
        Text(" "),
        TextField(
  obscureText: false,
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: '',
  ),
)
      ],
    );
  }
}