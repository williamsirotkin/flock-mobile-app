import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class SwipePage extends StatelessWidget {

   @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Image.network("https://e0.pxfuel.com/wallpapers/920/682/desktop-wallpaper-high-resolution-michael-scott-lujayn-colebourn-michael-scott-the-office.jpg", fit: BoxFit.cover, height: 440),
          ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(55.0),
              )
            ),
            backgroundColor: MaterialStateProperty.all(Colors.green),
            padding:
                MaterialStateProperty.all(const EdgeInsets.all(10)),
            textStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 15, color: Colors.white))),
            onPressed: () {},
            child: const Text('Add Friend + ')),
      Text("Micheal Scott"),
      ]
    );
  }
  }