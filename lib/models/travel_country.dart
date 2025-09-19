class TravelCountry {
  final String country;
  final String imageUrl;
  final DateTime fromDate;
  final DateTime toDate;
  final int rating;

  TravelCountry({
    required this.country,
    required this.imageUrl,
    required this.fromDate,
    required this.toDate,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'imageUrl': imageUrl,
      'fromDate': fromDate.toIso8601String(),
      'toDate': toDate.toIso8601String(),
      'rating': rating,
    };
  }

  factory TravelCountry.fromMap(Map<String, dynamic> map) {
    return TravelCountry(
      country: map['country'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      fromDate: DateTime.parse(map['fromDate']),
      toDate: DateTime.parse(map['toDate']),
      rating: map['rating'] ?? 0,
    );
  }
}