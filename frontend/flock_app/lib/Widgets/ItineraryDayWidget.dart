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
        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5FeO6J6NEl9Ek-eMuFWwsfMgTadTqliscOw&usqp=CAU", fit: BoxFit.cover, height: 325),
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
        Text("Home to the world’s most active volcanoes, the only royal palace in the U.S. and the welcoming aloha spirit—Hawaiʻi is like no place on earth. Discover the glimmering ocean, emerald valleys and golden sands; get lost in the spiritual beauty of the hula and find out how the warmth of Hawaiʻi’s people wonderfully complement the islands’ perfect temperatures. We invite you to explore the Islands of Aloha to find your own heavenly Hawaiʻi experiences. Aloha. ")
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