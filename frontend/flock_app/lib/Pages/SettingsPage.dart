import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import './WelcomePage.dart';
import '../Widgets/MenuProvider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // var appState = context.watch<MyAppState>();

    return ListView(
      shrinkWrap: true,
      children: [
        Text("Settings Page"),
        ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => WelcomePage()));},
                child: const Text('Back to Login (Temporary)')),
      ],
    );
  }
}