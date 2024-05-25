import 'package:bookstore/src/data/company.dart';
import 'package:bookstore/src/widgets/members/address.dart';
import 'package:flutter/material.dart';

class CompanyWidget extends StatelessWidget {
  final Company company;

  const CompanyWidget({required this.company, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Department: ${company.department}'),
        Text('Name: ${company.name}'),
        Text('Title: ${company.title}'),
        AddressWidget(address: company.address),
      ],
    );
  }
}