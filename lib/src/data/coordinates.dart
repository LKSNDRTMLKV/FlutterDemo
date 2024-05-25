class Coordinates {
  Coordinates({
    required this.lat,
    required this.lng,
  });

  final double lat;
  final double lng;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json['lat'] as double,
        lng: json['lng'] as double,
      );
}