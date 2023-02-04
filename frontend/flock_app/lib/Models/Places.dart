import './Place.dart';

class Places {
  final List<dynamic> results;

  const Places({
    required this.results,
  });

  factory Places.fromJson(Map<String, dynamic> json) {
    return Places(
      results: json['results'],
    );
  }
}