import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'package:flutter_spinbox/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpPage extends StatelessWidget {
  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";
  String city = "";
  String country = "";
  String socialMediaLink = "";
  double age = 0;

  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  password = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                )),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  city = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'City',
                )),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  country = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Country',
                )),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  socialMediaLink = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Social Media Link',
                )),
          ),
          Row(
            children: [
              Text("                         "),
              Text("Age:   "),
              SizedBox(
                height: 50,
                width: 150,
                child: CupertinoSpinBox(
                  min: 1,
                  max: 100,
                  value: 50,
                  onChanged: (value) => age = value,
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
                createAlbum("newUser");
              },
              child:
                  const Text('Create Account', style: TextStyle(fontSize: 22))),
        ]),
      ),
    );
  }

  Future<http.Response> createAlbum(String title) {
    return http.post(
      Uri.parse('http://127.0.0.1:5000/profile/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'city': city,
        'country': country,
        'social': socialMediaLink,
        'age': age.toString()
      }),
    );
  }
}
