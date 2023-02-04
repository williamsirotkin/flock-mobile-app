import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Widgets/BackButtonWidget.dart';
import './FindTripsPage.dart';
import '../Widgets/SuggestedPlaceWidget.dart';

class TripDetailsPage extends StatelessWidget {
  var user;
  TripDetailsPage({this.user});
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        BackButtonWidget(page: FindTripsPage(user: user)),
        Text("Trip Details Page"),
      ],
    );
  }
}