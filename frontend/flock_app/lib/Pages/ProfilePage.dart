import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Widgets/MenuProvider.dart';
import './EditProfilePage.dart';

class ProfilePage extends StatelessWidget {
  var user, profileClickedOn;
  ProfilePage({this.user, this.profileClickedOn});


  @override
  Widget build(BuildContext context) {
   // var appState = context.watch<MyAppState>();
    Widget showEdit(String user, String profileClickedOn) {
    if (user == profileClickedOn) {
      return ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: EditProfilePage(user: user))));},
                child: const Text('Edit Profile'));
    } return Text("");
      }

    return ListView(
      shrinkWrap: true,
      children: [
        Text("Profile Page"),
        showEdit(user, profileClickedOn),
      ],
    );
  }
}