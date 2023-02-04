import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Pages/TripPage.dart';
import '../Widgets/BackButtonWidget.dart';
import '../Pages/SuggestedActivitiesPage.dart';
import '../Pages/ItineraryPage.dart';
import '../Widgets/MenuProvider.dart';

class ItineraryNavBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // var appState = context.watch<MyAppState>();

    return ListView(
      shrinkWrap: true,
      children: [
        BackButtonWidget(page: TripPage()),
        Row (
          children: [
        TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: ItineraryPage(dayAndNight: "Day", numberDay: 1))));},
            child: const Text(' My Trip Itinerary', style: TextStyle(fontSize: 19)),
          ),
          Text("    "),
        TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: SuggestedActivitiesPage())));},
            child: const Text('Suggested Activities', style: TextStyle(fontSize: 19)),
          ),
          ]
        ),
      ],
    );
  }
}