import 'package:bookstore/src/data/bank.dart';
import 'package:flutter/material.dart';


class BankWidget extends StatelessWidget {
  final Bank bank;

  const BankWidget({required this.bank, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Card Expire: ${bank.cardExpire}'),
        Text('Card Number: ${bank.cardNumber}'),
        Text('Card Type: ${bank.cardType}'),
        Text('Currency: ${bank.currency}'),
        Text('IBAN: ${bank.iban}'),
      ],
    );
  }
}
