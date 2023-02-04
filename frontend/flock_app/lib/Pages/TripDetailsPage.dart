import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Widgets/BackButtonWidget.dart';
import './FindTripsPage.dart';
import '../Widgets/SuggestedPlaceWidget.dart';

class TripDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        BackButtonWidget(page: FindTripsPage()),
        Text("Trip Details Page"),
      ],
    );
  }
}