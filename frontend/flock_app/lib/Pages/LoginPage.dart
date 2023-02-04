import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import './SwipePage.dart';
import '../Widgets/MenuProvider.dart';
import '../Calls/LoginCall.dart';

String helper(bool error) {
  if (error) {
    return "There was an error logging you in";
  }
  return "";
}

class LoginPage extends StatelessWidget {
  var loginError;
  LoginPage({this.loginError});
  var username = "";
  var password = "";
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
        Text(helper(loginError), style: TextStyle(fontSize: 20, color: Colors.red)),
        Row (
          children: [
            Text("                     "),
            Column (
              children: [
        SizedBox (
        height: 50,
        width: 200,
        child: TextField(onChanged: (newText) {
            username = newText;
        },obscureText: false,
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
        child: TextField(onChanged: (newText) {
            password = newText;
        },obscureText: true,
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
                onPressed: () async {
                  var response = await login(username, password);
                  if (response.statusCode == 200) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: SwipePage(username: "stephennemeth4", user: username), user: username)));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: LoginPage(loginError: true))));
                  }
                },
                child: const Text('        Login       ')),
              ],
               ),
                           Text(" "),
      ],
        )
      ]
    )
    );
  }
}