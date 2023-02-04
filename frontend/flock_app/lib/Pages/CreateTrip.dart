import 'dart:convert';

import 'package:english_words/english_words.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class CreateTripPage extends StatelessWidget {
  String name = "";
  String max_number = "";
  String destination = "";
  String requirements = "";
  String description = "";
  String estimated_cost = "";
  String start_date = "";
  String end_date = "";

  var user;

  CreateTripPage({this.user});
  //String leader = user; // username of the person who created it

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Create a trip!', style: TextStyle(fontSize: 30)),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  name = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Trip Name',
                )),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (newText) {
                  max_number = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Max Number of People',
                )),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  destination = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Destination',
                )),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  requirements = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Requirements',
                )),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  description = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                )),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  estimated_cost = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Estimated Cost',
                )),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  start_date = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Start Date',
                )),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  end_date = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'End Date',
                )),
          ),
          /*SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  start_date = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Start Date',
                )),
          ),
          SizedBox(
              height: 50,
              width: 200,
              child: InputDatePickerFormField(
                onDateSaved: (value) {
                  start_date = value as String;
                },
                firstDate: DateTime.now(),
                lastDate: DateTime.parse('2025-07-20 20:18:04Z'),
                fieldLabelText: 'Start Date',
              )),
          SizedBox(
              height: 50,
              width: 200,
              child: InputDatePickerFormField(
                onDateSaved: (value) {
                  end_date = value as String;
                },
                firstDate: DateTime.now(),
                lastDate: DateTime.parse('2025-07-20 20:18:04Z'),
                fieldLabelText: 'End Date',
              )),*/
          Text(' '),
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
                createAlbum("newTrip");
              },
              child: const Text('Create Trip', style: TextStyle(fontSize: 22))),
        ]),
      )),
    );
  }

  Future<http.Response> createAlbum(String title) {
    print(name);
    print(description);
    print(requirements);
    return http.post(
      Uri.parse('http://127.0.0.1:5000/trip/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'max_number': max_number,
        'username': user,
        'destination': destination,
        'requirements': requirements,
        'description': description,
        'estimated_cost': estimated_cost,
        'start_date': start_date,
        'end_date': end_date
      }),
    );
  }
}
