import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class FriendWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // var appState = context.watch<MyAppState>();

    return ListView(
      shrinkWrap: true,
      children: [
        Row(
        children: [Image.network("https://e0.pxfuel.com/wallpapers/920/682/desktop-wallpaper-high-resolution-michael-scott-lujayn-colebourn-michael-scott-the-office.jpg", fit: BoxFit.cover, height: 80),
        Column (
          children: [
            Text("Micheal Scott"),
            Row (
              children: [
                Text("  "),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(5)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 12, color: Colors.white))),
                onPressed: () {},
                child: const Text('Message')),
                Text("  "),
                  ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(5)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 12, color: Colors.white))),
                onPressed: () {},
                child: const Text('View Profile')),
                Text("  "),
                  ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(5)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 12, color: Colors.white))),
                onPressed: () {},
                child: const Text('Unfriend')),
              ]
            ),
          ]
        )
        ]
        ),
        Text(" ")
      ],
    );
  }
}