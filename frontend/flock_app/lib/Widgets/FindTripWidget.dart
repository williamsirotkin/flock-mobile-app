import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import './MenuProvider.dart';


class FindTripWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    color: Color.fromARGB(255, 190, 189, 189),
    child: ListView(
      shrinkWrap: true,
      children: [
        Row(children: [
          Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZteG1ce3_aHIp1-KASP59zOnKXT4DScQhikN4nxz9yPhl4ew02IIqXfwSexir1zMWr8Q&usqp=CAU", fit: BoxFit.cover, height: 125),
          Column(children: [
            Text("Paris, France"),
            Text("May 12th - May 21st"),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () {},
                child: const Text('View Trip')),
          ])
        ])
      ],
    )
    );
  }
}