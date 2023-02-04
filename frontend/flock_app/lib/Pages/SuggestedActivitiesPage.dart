import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Widgets/BackButtonWidget.dart';
import './ItineraryPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/Place.dart';
import '../Models/Places.dart';
import '../Widgets/SuggestedPlaceWidget.dart';
import '../Widgets/ItineraryNavBarWidget.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class SuggestedActivitiesPage extends StatelessWidget {
  late Future<Places> futurePlaces;
  var user;
    SuggestedActivitiesPage({this.user});
  @override
  Widget build(BuildContext context) {
    Future<Places> fetchPlaces() async {
  final response = await http
      .get(Uri.parse('https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=cruise&location=-33.8670522%2C151.1957362%20%20%20&radius=1500%20%20%20&type=restaurant&key=' + dotenv.env['places_key']!));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(jsonDecode(response.body));
    return Places.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load places');
  }
}
    return ListView(
      shrinkWrap: true,
      children: [
        ItineraryNavBarWidget(),
        Center(child: Text("Suggested Activities Page", style: TextStyle(fontSize: 20))),
        Text(" "),
        FutureBuilder<Places>(
  future: fetchPlaces(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      List<Widget> temp = [];
      for (int i = 0; i < snapshot.data!.results.length; i++) {
          temp.add(SuggestedPlaceWidget(name: snapshot.data!.results[i]['name'], photos: snapshot.data!.results[i]['photos'], rating: snapshot.data!.results[i]['rating']));
        }
      return Column (children: 
        temp
      );
    } else if (snapshot.hasError) {
      return Text('${snapshot.error}');
    }

    // By default, show a loading spinner.
    return const CircularProgressIndicator();
  },
)
      ],
    );
  }
}