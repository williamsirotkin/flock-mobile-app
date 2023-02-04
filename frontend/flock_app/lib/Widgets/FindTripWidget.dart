import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Pages/TripDetailsPage.dart';
import './MenuProvider.dart';

class FindTripWidget extends StatelessWidget {
  var page, user, image, location, dates;
    FindTripWidget({this.page, this.user, this.image, this.location, this.dates});
    
  @override
  Widget build(BuildContext context) {

    return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
            topLeft: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0)),
            color: Color.fromARGB(255, 169, 199, 214),
      ),
    child: ListView(
      shrinkWrap: true,
      children: [
        ClipRRect (
     borderRadius: BorderRadius.circular(30.0),
        child: Row(children: [
        Image.network(image,fit: BoxFit.cover, height: 125, width: 200),
          Column(children: [
            Text(location, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(" ", style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
            Text(dates),
            Text(" ", style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
            ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                        ),
                  ),
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: (TripDetailsPage()))));},
                child: const Text('View Trip')),
          ])
        ])
        ),
      ],
    )
    );
  }
}