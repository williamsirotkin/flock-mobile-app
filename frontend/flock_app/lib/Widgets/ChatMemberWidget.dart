import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class ChatMemberWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // var appState = context.watch<MyAppState>();

    return ListView(
      shrinkWrap: true,
      children: [
        Row(
        children: [Image.network("https://parade.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTkwNTc4NDc4NDg3Nzc0MzMz/ron-swanson-from-parks-and-recreation.jpg", fit: BoxFit.cover, height: 80),
        Column (
          children: [
            Text("Ron Swanson"),
            Row (
              children: [
                Text("  "),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(5)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 11, color: Colors.white))),
                onPressed: () {},
                child: const Text('Add Friend +')),
                Text("   "), 
                ElevatedButton (
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(5)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 11, color: Colors.white))),
                onPressed: () {},
                child: const Text('View Profile')),
                Text(" "),
                Text("  "),
                  ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(5)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 11, color: Colors.white))),
                onPressed: () {},
                child: const Text('Vote to Kick')),
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