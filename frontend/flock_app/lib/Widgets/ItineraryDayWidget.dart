import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Pages/ItineraryPage.dart';
import './MenuProvider.dart';

class ItineraryDayWidget extends StatelessWidget {

    var dayAndNight;
    var numberDay;
  ItineraryDayWidget({this.dayAndNight, this.numberDay});


  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ClipRRect (
          borderRadius: BorderRadius.circular(25),
        child: Image.network(getImageURL((dayAndNight)), fit: BoxFit.cover, height: 325)),
          Row (
          children: [
            Text("              "),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(5)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: ItineraryPage(dayAndNight: funcStr(dayAndNight, numberDay), numberDay: funcNum("prev", dayAndNight, numberDay)))));},
                child: const Text('<- Previous')),
              Text("    "),
            Center(child: Text(dayAndNight + " " + numberDay.toString(), style: TextStyle(fontSize: 25))),
            Text("    "),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(5)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: ItineraryPage(dayAndNight: funcStr(dayAndNight, numberDay), numberDay: funcNum("next", dayAndNight, numberDay)))));},
                child: const Text('    Next ->    ')),
          ]
        ),
        getPlan(numberDay * 2 - 2),
      ],
    );
  }
}

String funcStr(dayOrNight, numDay) {
    if (dayOrNight == "Night") {
      return "Day";
    } 
    return "Night";
}

int funcNum(nextOrPrev, dayOrNight, numDay) {
  if (nextOrPrev == "next") {
    if (dayOrNight == "Night") {
      return numDay + 1;
    }
  } else if (dayOrNight == "Day") {
    if (numDay == 1) {
      return 1;
    }
    return numDay - 1;
  }

  return numDay;
}



Widget getPlan(day) {
  switch(day) {
        case 0:
          return Text("Australia, officially the Commonwealth of Australia, is a sovereign country comprising the mainland of the Australian continent, the island of Tasmania, and numerous smaller islands.[13] With an area of 7,617,930 square kilometres (2,941,300 sq mi),[14] Australia is the largest country by area in Oceania and the world's sixth-largest country.");
        case 1:
          return Text("Australia, officially the Commonwealth of Australia, is a sovereign country comprising the mainland of the Australian continent, the island of Tasmania, and numerous smaller islands.[13] With an area of 7,617,930 square kilometres (2,941,300 sq mi),[14] Australia is the largest country by area in Oceania and the world's sixth-largest country.");
        case 2:
          return Text("Australia, officially the Commonwealth of Australia, is a sovereign country comprising the mainland of the Australian continent, the island of Tasmania, and numerous smaller islands.[13] With an area of 7,617,930 square kilometres (2,941,300 sq mi),[14] Australia is the largest country by area in Oceania and the world's sixth-largest country.");
        case 3:
          return Text("Australia, officially the Commonwealth of Australia, is a sovereign country comprising the mainland of the Australian continent, the island of Tasmania, and numerous smaller islands.[13] With an area of 7,617,930 square kilometres (2,941,300 sq mi),[14] Australia is the largest country by area in Oceania and the world's sixth-largest country.");
        case 4:
          return Text("Australia, officially the Commonwealth of Australia, is a sovereign country comprising the mainland of the Australian continent, the island of Tasmania, and numerous smaller islands.[13] With an area of 7,617,930 square kilometres (2,941,300 sq mi),[14] Australia is the largest country by area in Oceania and the world's sixth-largest country.");
        case 5:
          return Text("Australia, officially the Commonwealth of Australia, is a sovereign country comprising the mainland of the Australian continent, the island of Tasmania, and numerous smaller islands.[13] With an area of 7,617,930 square kilometres (2,941,300 sq mi),[14] Australia is the largest country by area in Oceania and the world's sixth-largest country.");
       }
      return Text("Australia");
}

String getImageURL(day) {
      if (day == "Day") {
            return "https://upload.wikimedia.org/wikipedia/commons/a/a0/Sydney_Australia._%2821339175489%29.jpg";
      } return "https://www.kkday.com/en/blog/wp-content/uploads/Australia_Sydney_AFotolia_155673241.jpg";
}