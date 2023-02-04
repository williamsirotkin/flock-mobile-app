import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import './ProfilePage.dart';
import '../Widgets/MenuProvider.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // var appState = context.watch<MyAppState>();

    return ListView(
      shrinkWrap: true,
      children: [
        ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: (ProfilePage()))));},
                child: const Text('Done')),
        Center (child: Text("My Profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)),
        Text(" "),
        Center (child: Text("Basic Info", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
        Name(),
        BasicInfo(),
        ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: (ProfilePage()))));},
                child: const Text('Done')),
      ],
    );
  }
}

class Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Row (
          children: [
            Text("  "),
        SizedBox (
        height: 20,
        width: 15,
        child: TextField(obscureText: false,
          decoration: InputDecoration(
           border: OutlineInputBorder(),
          labelText: 'First Name',
        )
        ),
        ),
        Text("     "),
        SizedBox (
        height: 200,
        width: 175,
        child: TextField(obscureText: false,
          decoration: InputDecoration(
           border: OutlineInputBorder(),
          labelText: 'Last Name',
        )
        ),
        ),
          ]
        );
  }
}

class BasicInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // var appState = context.watch<MyAppState>();

    return ListView(
      shrinkWrap: true,
      children: [
        Column (
          children: [
        Row (
          children: [
            Text("  "),
        SizedBox (
        height: 200,
        width: 175,
        child: TextField(obscureText: false,
          decoration: InputDecoration(
           border: OutlineInputBorder(),
          labelText: 'First Name',
        )
        ),
        ),
        Text("     "),
        SizedBox (
        height: 200,
        width: 175,
        child: TextField(obscureText: false,
          decoration: InputDecoration(
           border: OutlineInputBorder(),
          labelText: 'Last Name',
        )
        ),
        ),
          ]
        ),
      Row (children: [
        Text("  "),
         SizedBox (
        height: 200,
        width: 115,
        child: TextField(obscureText: false,
          decoration: InputDecoration(
           border: OutlineInputBorder(),
          labelText: 'Age',
        )
        ),
        ),
        Text("  "),
        SizedBox (
        height: 200,
        width: 115,
        child: TextField(obscureText: false,
          decoration: InputDecoration(
           border: OutlineInputBorder(),
          labelText: 'City',
        )
        ),
        ),
        Text("  "),
        SizedBox (
        height: 200,
        width: 115,
        child: TextField(obscureText: false,
          decoration: InputDecoration(
           border: OutlineInputBorder(),
          labelText: 'Country',
        )
        ),
        ),
      ],),
      Text("I identify as..."),
      Row (children: [
        ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () {
                  print("Male");
                },
                child: const Text('Male')),
                ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () {
                  print("Female");
                },
                child: const Text('Female')),
                SizedBox (
                  height: 200,
                  width: 175,
                  child: TextField(obscureText: false,
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Other (Please Specify)',
                  )
                  ),
                  ),
      ],),
      Text("Upload Your Profile Image"),
      ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                        onPressed: () {
                  print("Female");
                },
                child: const Text('Upload Image')),
          ],
        )
      ],
    );
  }
}