import 'package:bookstore/src/data/address.dart';
import 'package:bookstore/src/widgets/members/coordinates.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  final Address address;

  const AddressWidget({required this.address, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Country: ${address.country}'),
        Text('State: ${address.state}'),
        Text('State Code: ${address.stateCode}'),
        Text('City: ${address.city}'),
        Text('Postal Code: ${address.postalCode}'),
        Text('Address: ${address.address}'),
        CoordinatesWidget(coordinates: address.coordinates)
      ],
    );
  }
}