import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import './MenuProvider.dart';

class BackButtonWidget extends StatelessWidget {
   var page;
    BackButtonWidget({this.page});
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: (page))));},
                child: const Text('<- Go Back')),
      ],
    );
  }
}