import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Pages/TripPage.dart';
import './MenuProvider.dart';

class MyTripWidget extends StatelessWidget {
  var page, user;
    MyTripWidget({this.page, this.user});
    
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
        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZteG1ce3_aHIp1-KASP59zOnKXT4DScQhikN4nxz9yPhl4ew02IIqXfwSexir1zMWr8Q&usqp=CAU",fit: BoxFit.cover, height: 125),
          Column(children: [
            Text("  Paris, France", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(" ", style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
            Text("   May 12th - May 21st"),
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
                onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: (TripPage()))));},
                child: const Text('View Trip')),
          ])
        ])
        ),
      ],
    )
    );
  }
}