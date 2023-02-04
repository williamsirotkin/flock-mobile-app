import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import './TripPage.dart';
import '../Widgets/BackButtonWidget.dart';
import '../Widgets/ChatMemberWidget.dart';

class ChatSettingsPage extends StatelessWidget {
  var user;
    ChatSettingsPage({this.user});
  @override
  Widget build(BuildContext context) {
   // var appState = context.watch<MyAppState>();

    return ListView(
      shrinkWrap: true,
      children: [
        BackButtonWidget(page: TripPage()),
        Center(child: Text("Members", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        Text(" "),
        ChatMemberWidget(),
        ChatMemberWidget(),
        ChatMemberWidget(),
        ChatMemberWidget(),
        ChatMemberWidget(),
        ChatMemberWidget(),
      ],
    );
  }
}