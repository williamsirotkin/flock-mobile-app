import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Widgets/MenuProvider.dart';

class InboxPage extends StatelessWidget {
  var page, user;
    InboxPage({this.page, this.user});
  @override
  Widget build(BuildContext context) {

    return ListView(
      shrinkWrap: true,
      children: [
        Center(child: Text("My Inbox", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
        Image(image: AssetImage('assets/images/inboxImage.png')),
        Text(" "),
        Text(" "),
        Text(" "),
        Text(" "),
        Text(" "),
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