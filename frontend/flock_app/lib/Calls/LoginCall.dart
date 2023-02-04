import 'package:http/http.dart' as http;
import 'dart:convert';


Future<http.Response> login(String username, String password) async {
    final http.Client client;
    final response = await http.put(
      Uri.parse('http://127.0.0.1:5000/profile/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    return response;
}