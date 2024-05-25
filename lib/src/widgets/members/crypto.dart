import 'package:bookstore/src/data/crypto.dart';
import 'package:flutter/material.dart';

class CryptoWidget extends StatelessWidget {
  final Crypto crypto;

  const CryptoWidget({required this.crypto, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Coin: ${crypto.coin}'),
        Text('Wallet: ${crypto.wallet}'),
        Text('Network: ${crypto.network}'),
      ],
    );
  }
}
