import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import './TripPage.dart';
import '../Widgets/BackButtonWidget.dart';
import './SuggestedActivitiesPage.dart';
import '../Widgets/ItineraryNavBarWidget.dart';
import '../Widgets/ItineraryDayWidget.dart';

class ItineraryPage extends StatelessWidget {
  var dayAndNight;
  var numberDay;
  ItineraryPage({this.dayAndNight, this.numberDay});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ItineraryNavBarWidget(),
        ItineraryDayWidget(dayAndNight: dayAndNight, numberDay: numberDay),
      ],
    );
  }
}