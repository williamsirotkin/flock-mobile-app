import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingWidget extends StatelessWidget {
  var desc, rating;
  RatingWidget(this.desc, this.rating);

  @override
  Widget build(BuildContext context) {
    return Container (
      color: Colors.grey,
    child: ListView(
      shrinkWrap: true,
      children: [
        Column (
          children: [
        Text(desc),
        RatingBar.builder(
   initialRating: rating.toDouble(),
   minRating: 1,
   direction: Axis.horizontal,
   allowHalfRating: true,
   itemCount: 5,
   itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
   itemBuilder: (context, _) => 
     Image(image: AssetImage('assets/images/star.png'),
     height: 250,
   ),
   onRatingUpdate: (rating) {
     print(rating);
   },
),
      ],
        ),
      ],
    )
    );
  }
}