import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import './MenuProvider.dart';

class RequestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // var appState = context.watch<MyAppState>();

    return ListView(
      shrinkWrap: true,
      children: [
        Row(
        children: [Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcIo5KjXrNxALfHj3WxtziK8SBb3OpnOGXgQ&usqp=CAU", fit: BoxFit.cover, height: 80),
        Column (
          children: [
            Text("Dwight Schrute"),
            Row (
              children: [
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
                Text("   "), 
                ElevatedButton (
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(5)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 12, color: Colors.white))),
                onPressed: () {},
                child: const Text('Vote Accept')),
                Text(" "),
                Text("  "),
                  ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(5)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 12, color: Colors.white))),
                onPressed: () {},
                child: const Text('Vote Deny')),
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