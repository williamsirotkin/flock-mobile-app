class Usernames {
  final List<dynamic> usernames;

  const Usernames({
    required this.usernames,
  });

  factory Usernames.fromJson(Map<String, dynamic> json) {
    return Usernames(
      usernames: json['usernames'],
    );
  }
}