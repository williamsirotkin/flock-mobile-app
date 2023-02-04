import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SuggestedPlaceWidget extends StatelessWidget {
  var name;
  var photos;
  var rating;

  SuggestedPlaceWidget({this.name, this.photos, this.rating});

  @override
  Widget build(BuildContext context) {
    List<Widget> photoList = [];
    List<Widget> suggestedPlaceList = [];
    for (int i = 0; i < photos.length; i++) {
      print(photos[i].toString());
          photoList.add(Image.network('https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=' + photos[i]['photo_reference'] + '&key=' + dotenv.env['places_key']!, height: 90, width: 130));
      }
    for (int i = 0; i < photos.length; i++) {
        suggestedPlaceList.add(
          Column (
            children: [ 
          Row (
            children: [
              photoList[i],
              Column (
              children: [Text(" " + name, style: TextStyle(fontSize: 15)),
              RatingBar.builder(
   initialRating: rating.toDouble(),
   minRating: 1,
   direction: Axis.horizontal,
   allowHalfRating: true,
   itemCount: 5,
   itemPadding: EdgeInsets.symmetric(horizontal: 5.0),
   itemBuilder: (context, _) => 
     Image(image: AssetImage('assets/images/star.png'),
     height: 180,
   ),
   onRatingUpdate: (rating) {
     print(rating);
   },
),
Row (
  children: [
                    ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(7.5)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () {},
                child: const Text('More Info')),
                Text("   "),
ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(7.5)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () {print("add to trip itinerary");},
                child: const Text('Add to Trip Itinerary')),
  ]
),
              ]
              )
            ]
          ),
          Text(" "),
            ]
        )
        );
    }

    return ListView(
      shrinkWrap: true,
      children:
        suggestedPlaceList,
    );
  }
}