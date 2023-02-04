class Trip {
  final String name;
  final String max_number;
  final String current_number;
  final List<dynamic> list_of_users;
  final String leader;
  final String destination;
  final String requirements;
  final String description;
  final String estimated_cost;
  final String start_date;
  final String end_date;
  final List<dynamic> list_of_request;

  const Trip({
    required this.name,
    required this.max_number,
    required this.current_number,
    required this.list_of_users,
    required this.leader,
    required this.destination,
    required this.requirements,
    required this.description,
    required this.estimated_cost,
    required this.start_date,
    required this.end_date,
    required this.list_of_request,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      name: json['name'],
      max_number: json['max_number'],
      current_number: json['current_number'],
      list_of_users: json['list_of_users'],
      leader: json['leader'],
      destination: json['destination'],
      requirements: json['requirements'],
      description: json['description'],
      estimated_cost: json['estimated_cost'],
      start_date: json['start_date'],
      end_date: json['end_date'],
      list_of_request: json['list_of_request'],
    );
  }
}
