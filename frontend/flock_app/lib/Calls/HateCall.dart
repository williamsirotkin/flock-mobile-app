import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> hate(Future<String> hater, Future<String> hatee) async {
    return http.put(
      Uri.parse('http://127.0.0.1:5000/profile/hate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'hater': await hater,
        'hatee': await hatee,
      }),
    );
}