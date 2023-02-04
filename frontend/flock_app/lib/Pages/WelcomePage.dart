import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import './LoginPage.dart';
import './SignUpPage.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(shrinkWrap: true, children: [
      Text(" "),
      Text(" "),
      Text(" "),
      Text(" "),
      Text(" "),
      Image(image: AssetImage('assets/images/WelcomePageImage.png')),
      Text(" "),
      Text(" "),
      Text(" "),
      Row(children: [
        Text("               "),
        SizedBox(
          height: 60,
          width: 250,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 44, 155, 234)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 14, color: Colors.white))),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: const Text('Sign Up', style: TextStyle(fontSize: 22))),
        ),
        Text(" "),
      ]),
      Text(" ", style: TextStyle(fontSize: 8)),
      Row(children: [
        Text("               "),
        SizedBox(
          height: 60,
          width: 250,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 4, 199, 59)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 14, color: Colors.white))),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: const Text('Login', style: TextStyle(fontSize: 22))),
        ),
        Text(" "),
      ]),
    ]));
  }
}
