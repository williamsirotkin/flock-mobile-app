import 'package:http/http.dart' as http;
import 'dart:convert';


Future<http.Response> like(Future<String> liker, Future<String> likee) async {
    return http.put(
      Uri.parse('https://flock.dynv6.net/profile/like'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'liker':await  liker,
        'likee': await likee,
      }),
    );
}