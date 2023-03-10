import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Widgets/MenuProvider.dart';
import '../Widgets/FriendWidget.dart';

class FriendsPage extends StatelessWidget {
  var page, user;
    FriendsPage({this.page, this.user});
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text(" "),
        Center(child: Text("My Friends", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
        Text(" "),
        FriendWidget(),
        FriendWidget(),
        FriendWidget(),
        FriendWidget(),
        FriendWidget(),
        FriendWidget(),
        FriendWidget(),
      ],
    );
  }
}