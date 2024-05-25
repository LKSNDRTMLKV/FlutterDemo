import 'package:bookstore/src/data/coordinates.dart';
import 'package:flutter/material.dart';

class CoordinatesWidget extends StatelessWidget {
  final Coordinates coordinates;

  const CoordinatesWidget({required this.coordinates, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Latitude: ${coordinates.lat}'),
        Text('Longitude: ${coordinates.lng}'),
      ],
    );
  }
}
