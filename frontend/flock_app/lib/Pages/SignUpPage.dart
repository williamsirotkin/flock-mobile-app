import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'package:flutter_spinbox/cupertino.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String firstName = "";
    String lastName = "";
    String email = "";

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(image: AssetImage('assets/images/LoginPageImage.png')),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  firstName = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                )),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  lastName = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                )),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  email = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                )),
          ),
          Row(
            children: [
              Text("                              "),
              SizedBox(
                height: 50,
                width: 200,
                child: CupertinoSpinBox(
                  min: 1,
                  max: 100,
                  value: 50,
                  onChanged: (value) => print(value),
                ),
              )
            ],
          ),
          ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 17, 219, 51)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 14, color: Colors.white))),
              onPressed: () {
                print(firstName);
                print(lastName);
                print(email);
              },
              child:
                  const Text('Create Account', style: TextStyle(fontSize: 22))),
        ]),
      ),
    );
  }
}
