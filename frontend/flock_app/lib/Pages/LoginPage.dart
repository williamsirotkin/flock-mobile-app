import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import './SwipePage.dart';
import '../Widgets/MenuProvider.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: ListView(
      shrinkWrap: true,
      children: [
        Image(image: AssetImage('assets/images/LoginPageImage.png')),
        Text(" "),
        Text(" "), 
        Text(" "),
        Text(" "),
        Row (
          children: [
            Text("                     "),
            Column (
              children: [
        SizedBox (
        height: 50,
        width: 200,
        child: TextField(obscureText: false,
          decoration: InputDecoration(
           border: OutlineInputBorder(),
          labelText: 'Username',
        )
        ),
        ),
        Text(" "),
        SizedBox (
        height: 50,
        width: 200,
        child: TextField(obscureText: true,
          decoration: InputDecoration(
           border: OutlineInputBorder(),
          labelText: 'Password',
        )
        ),
        ),
        Text(" "),
        ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(15)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 15, color: Colors.white)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)
                        ),
                        ),
                        ),
                onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: SwipePage(username: "stephennemeth4"))));},
                child: const Text('        Login       ')),
      ],

    ),
    Text(" "),
          ]
        )
      ]
    )
    );

  }
}