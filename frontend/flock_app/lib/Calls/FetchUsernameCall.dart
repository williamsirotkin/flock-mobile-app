import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> fetchUsername() async {
        final response = await http
      .get(Uri.parse('http://127.0.0.1:5000/profile/getRandomUsername'));
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.
          print("Okay");
          print(jsonDecode(response.body));
          print("Okay");
          Map<String, dynamic> jsonStuff = jsonDecode(response.body);
          return jsonStuff['username'];
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          throw Exception('Failed to load person');
        }
}