import 'coordinates.dart';

class Address {
  Address({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    required this.coordinates,
    required this.country,
  });

  final String address;
  final String city;
  final String state;
  final String stateCode;
  final String postalCode;
  final Coordinates coordinates;
  final String country;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json['address'] as String,
        city: json['city'] as String,
        state: json['state'] as String,
        stateCode: json['stateCode'] as String,
        postalCode: json['postalCode'] as String,
        coordinates: Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
        country: json['country'] as String,
      );
}
