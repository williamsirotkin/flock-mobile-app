import 'dart:convert';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Widgets/MenuProvider.dart';
import './EditProfilePage.dart';
import '../Models/Person.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatelessWidget {
  String firstName = "Michael";
  String lastName = "Scott";
  String username = "michaelscott";
  String email = "michaelscott@email.com";
  String password = "dfhskfkds";
  String city = "Atlanta";
  String country = "USA";
  String bio =
      "I got two tickets to paradise. Live life to the fullest. 100% of the shots you don't take, oh how have the turn tables tabled.";
  var user, profileClickedOn;
  ProfilePage({this.user, this.profileClickedOn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 16.0),
            Text(
              "Michael Scott",
              style: TextStyle(fontSize: 22.0),
            ),
            SizedBox(height: 8.0),
            Text("michaelscott@email.com"),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Bio: Michael Scott is a sales representative"),
            ),
          ],
        ),
      ),
    );
  }
}
