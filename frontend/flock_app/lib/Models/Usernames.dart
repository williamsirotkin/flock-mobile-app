class Usernames {
  final String username;

  const Usernames({
    required this.username,
  });

  factory Usernames.fromJson(Map<String, dynamic> json) {
    return Usernames(
      username: json['username'],
    );
  }
}