import 'dart:collection';
import 'package:image_picker/image_picker.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'package:flutter_spinbox/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/*
Future getImage() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  print("LOOK HERE");
  print(image);
  print("LOOK HERE 2");
  return await image;
}
*/
class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

enum UserFacing {
  art,
  drinking,
  gym,
  nightlife,
  learning,
  coffee,
  outdoors,
  gambling,
  shopping,
  hiking,
  /*museums,
  wildlife,
  aviation,
  biking*/
}

final entries = {
  'art': 'art_gallery',
  'drinking': 'bar',
  'gym': 'gym',
  'nightlife': 'night_club',
  'learning': 'library',
  'coffee': 'cafe',
  'outdoors': 'campground',
  'gambling': 'casino',
  'shopping': 'shopping_mall',
  'hiking': 'park',
  'museums': 'museum',
  'wildlife': 'zoo',
  'aviation': 'airport',
  'biking': 'bicycle_store',
};

class _SignUpPageState extends State<SignUpPage> {
  var image;
  String first_name = "";
  String last_name = "";
  String username = "";
  String email = "";
  String password = "";
  String city = "";
  String country = "";
  List<String> selectedInterests = <String>[];
  //String socialMediaLink = "";
  double age = 0;
  //String interests = [];
  final List<String> _filters = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(image: AssetImage('assets/images/LoginPageImage.png')),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  first_name = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                )),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  last_name = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                )),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  password = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                )),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  email = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                )),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  password = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                )),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  city = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'City',
                )),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  country = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Country',
                )),
          ),
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
                onPressed: () async {},
                child: const Text('Upload Image')),
          SizedBox(
            height: 50,
            width: 200,
            child: TextField(
                onChanged: (newText) {
                  //socialMediaLink = newText;
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Social Media Link',
                )),
          ),
          Row(
            children: [
              Text("                         "),
              Text("Age:   "),
              SizedBox(
                height: 50,
                width: 150,
                child: CupertinoSpinBox(
                  min: 1,
                  max: 100,
                  value: 50,
                  onChanged: (value) => age = value,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Interests:'),
              const SizedBox(height: 5.0),
              Wrap(
                spacing: 5.0,
                children: UserFacing.values.map((UserFacing interest) {
                  return FilterChip(
                    label: Text(interest.name),
                    backgroundColor: Colors.blue,
                    selected: _filters.contains(interest.name),
                    onSelected: (bool value) {
                      setState(() {
                        if (value) {
                          if (!_filters.contains(interest.name)) {
                            _filters.add(interest.name);
                          }
                        } else {
                          _filters.removeWhere((String name) {
                            return name == interest.name;
                          });
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 10.0),
              Text('Looking for: ${_filters.join(', ')}')
            ],
          ),
          ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 17, 219, 51)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 14, color: Colors.white))),
              onPressed: () {
                for (var i = 0; i < _filters.length; i++) {
                  var currentElement = _filters[i];
                  var apiVal = entries[currentElement];
                  selectedInterests.add(apiVal!);
                }
                //interests = selectedInterests.toString();
                //print(interests);
                createAlbum("newUser");
              },
              
              child:
                  const Text('Create Account', style: TextStyle(fontSize: 22)))
        ]),
      ),
    );
  }

  Future<http.Response> createAlbum(String title) {
    print(selectedInterests);
    return http.post(
      Uri.parse('http://127.0.0.1:5000/profile/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, Object>{
        'first_name': "hi",
        'city': city,
        'country': country,
        'email': email,
        'last_name': last_name,
        'interests': selectedInterests,
        'username': username,
        'age': age.toString(),
        'password': password,
        'bio': "",
        'profile_pic_url': "",
      }),
    );
  }
}

/*
uploadToS3 (image)async{
    var postUri = Uri.parse("flock-access-4epyut6gke8z9mtbow4eif9hgmmgruse1a-s3alias"); /// url
    var request = http.MultipartRequest("POST", postUri);
    Map<String, String> headers = { "access-token": "dataStorage.read(authToken)"}; /// header
    request.headers.addAll(headers);
  
    request.files.add(
        File(await image!.path)); /// file that you need to send s3
    var response = await request.send();
    var responsed = await http.Response.fromStream(response);
  
    final responseData = json.decode(responsed.body);
  
    if (response.statusCode == 200) {
  /// if response.statuscode is 200 then you will get a image id from aws 
      var imagedetails= jsonDecode(responsed.body);
  
      /// s3 image id 
      print(imagedetails["imageId"]);
    }
}

uploadToS3(image) async {
  var request = http.MultipartRequest("POST", Uri.parse("https://flock-pictures.s3.amazonaws.com/4j+1GOdoBnWmQOKRcgdPlGa8FC2pdhsy9Q//Xwox"));
  var multipartFile = await http.MultipartFile.fromBytes(
    "file", 
    await image.readAsBytes(), 
    filename: image.path
  );
  request.files.add(multipartFile);
  return await request.send();
}
*/