class Crypto {
  Crypto({
    required this.coin,
    required this.wallet,
    required this.network,
  });

  final String coin;
  final String wallet;
  final String network;

  factory Crypto.fromJson(Map<String, dynamic> json) => Crypto(
        coin: json['coin'] as String,
        wallet: json['wallet'] as String,
        network: json['network'] as String,
      );
}