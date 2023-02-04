import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Widgets/MenuProvider.dart';
import '../Widgets/FriendWidget.dart';

class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Center(child: Text("My Friends", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        FriendWidget(),
        FriendWidget(),
        FriendWidget(),
        FriendWidget(),
        FriendWidget(),
      ],
    );
  }
}