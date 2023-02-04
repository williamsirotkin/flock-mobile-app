class Person {
  final String firstName;
  final String lastName;
  final String city;
  final String country; 
  final String email;
  final String bio;
  final List<String> interests;
  final String pic_url;

  const Person({
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.email,
    required this.country,
    required this.bio,
    required this.interests,
    required this.pic_url,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    print("1111");
    print(json['interests'].cast<String>());
    print("2222");
    return Person(
      firstName: json['first_name'],
      lastName: json['last_name'],
      city: json['city'],
      country: json['country'],
      email: json['email'],
      bio: json['bio'],
      interests: json['interests'].cast<String>(),
      pic_url: json['profile_pic_url'],
    );
  }
}