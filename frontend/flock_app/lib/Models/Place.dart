class Place {
  final String business_status;

  const Place({
    required this.business_status,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      business_status: json['business_status'],
      
    );
  }
}