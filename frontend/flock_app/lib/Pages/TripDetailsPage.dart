import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Widgets/BackButtonWidget.dart';
import './FindTripsPage.dart';
import '../Widgets/SuggestedPlaceWidget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TripDetailsPage extends StatelessWidget {
  var user;
  TripDetailsPage({this.user});

  @override
  Widget build(BuildContext context) {
    fetchTrip();
    return ListView(
      shrinkWrap: true,
      children: [
        BackButtonWidget(page: FindTripsPage(user: user)),
        Text("Trip Details Page"),
      ],
    );
  }

  Future<String> fetchTrip() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:5000/trip/get/tripfive'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(jsonDecode(response.body));
      Map<String, dynamic> jsonStuff = jsonDecode(response.body);
      return jsonStuff['max_number'];
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load trip');
    }
  }
}
