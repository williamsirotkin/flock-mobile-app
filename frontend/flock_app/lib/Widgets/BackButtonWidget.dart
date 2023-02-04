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
        Row (
          children: [
        Text(" "), 
        ClipRRect (
            borderRadius: BorderRadius.circular(90),
        child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 179, 177, 177)),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 12, color: Colors.white))),
                onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: (page))));},
                child: const Text('<- Go Back')),
        ),
      Text(" "),
      ],
    )
      ],
    );
  }
}