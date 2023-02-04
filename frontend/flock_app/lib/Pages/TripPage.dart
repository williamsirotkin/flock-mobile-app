import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Widgets/BackButtonWidget.dart';
import './MyTripsPage.dart';
import '../Widgets/MenuProvider.dart';
import './TripDetailsPage.dart';
import '../Widgets/ChatSettingsBarWidget.dart';

class TripPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        BackButtonWidget(page: MyTripsPage()),
        ChatSettingsBarWidget(),
      ],
    );
  }
}
