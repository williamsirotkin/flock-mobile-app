class Person {
  final String firstName;
  final String lastName;
  final String city;
  final String country; 
  final String email;
  final String bio;

  const Person({
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.email,
    required this.country,
    required this.bio,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      firstName: json['first_name'],
      lastName: json['last_name'],
      city: json['city'],
      country: json['country'],
      email: json['email'],
      bio: json['bio'],
    );
  }
}