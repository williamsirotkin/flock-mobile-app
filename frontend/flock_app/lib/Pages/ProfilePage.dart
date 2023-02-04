import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Widgets/MenuProvider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // var appState = context.watch<MyAppState>();


    return ListView(
      shrinkWrap: true,
      children: [
        Text("Profile Page"),
        ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () {},
                child: const Text('Edit Profile')),
      ],
    );
  }
}