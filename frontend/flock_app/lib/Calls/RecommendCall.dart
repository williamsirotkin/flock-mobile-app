import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> recommendCall(String username1, String username2) async {
        final response = await http
      .get(Uri.parse('https://flock.dynv6.net/profile/recommend')),
      body: jsonEncode(<String, String>{
        'username1': username1,
        'username2': username2,
      }),
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.
          print(jsonDecode(response.body));
          Map<String, dynamic> jsonStuff = jsonDecode(response.body);
          return jsonStuff['username'];
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          throw Exception('Failed to load person');
        }
}