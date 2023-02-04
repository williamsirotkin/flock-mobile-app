import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import './TripPage.dart';
import '../Widgets/BackButtonWidget.dart';
import '../Widgets/RequestWidget.dart';

class RequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // var appState = context.watch<MyAppState>();

    return ListView(
      shrinkWrap: true,
      children: [
        BackButtonWidget(page: TripPage()),
        Center(child: Text("Requests to Join Your Trip", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        Text(" "),
        RequestWidget(),
         RequestWidget(),
          RequestWidget(),
           RequestWidget(),
      ],
    );
  }
}