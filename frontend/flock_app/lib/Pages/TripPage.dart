import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Widgets/BackButtonWidget.dart';
import './MyTripsPage.dart';
import '../Widgets/MenuProvider.dart';
import './TripDetailsPage.dart';
import '../Widgets/ChatSettingsBarWidget.dart';
import '../Widgets/ChatWidget.dart';

class TripPage extends StatelessWidget {
  @override
  var user;
  TripPage({this.user});
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        BackButtonWidget(page: MyTripsPage()),
        ChatSettingsBarWidget(),
          ChatWidget(),
          Text(" "),
          Text(" "),
          Text(" "),
          Text(" "),
      ],
    );
  }
}
