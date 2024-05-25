import 'dart:convert';
import 'package:http/http.dart' as http;
import 'address.dart';
import 'bank.dart';
import 'company.dart';
import 'crypto.dart';

class Member {
  Member({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hairColor,
    required this.hairType,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.crypto,
    required this.role,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String username;
  final String password;
  final String birthDate;
  final String image;
  final String bloodGroup;
  final double height;
  final double weight;
  final String eyeColor;
  final String hairColor;
  final String hairType;
  final String ip;
  final Address address;
  final String macAddress;
  final String university;
  final Bank bank;
  final Company company;
  final String ein;
  final String ssn;
  final String userAgent;
  final Crypto crypto;
  final String role;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json['id'] as int,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        maidenName: json['maidenName'] as String,
        age: json['age'] as int,
        gender: json['gender'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String,
        username: json['username'] as String,
        password: json['password'] as String,
        birthDate: json['birthDate'] as String,
        image: json['image'] as String,
        bloodGroup: json['bloodGroup'] as String,
        height: json['height'].toDouble() as double,
        weight: json['weight'].toDouble() as double,
        eyeColor: json['eyeColor'] as String,
        hairColor: json['hair']['color'] as String,
        hairType: json['hair']['type'] as String,
        ip: json['ip'] as String,
        address: Address.fromJson(json['address'] as Map<String, dynamic>),
        macAddress: json['macAddress'] as String,
        university: json['university'] as String,
        bank: Bank.fromJson(json['bank'] as Map<String, dynamic>),
        company: Company.fromJson(json['company'] as Map<String, dynamic>),
        ein: json['ein'] as String,
        ssn: json['ssn'] as String,
        userAgent: json['userAgent'] as String,
        crypto: Crypto.fromJson(json['crypto'] as Map<String, dynamic>),
        role: json['role'] as String,
      );
}

class MemberState {
  List<Member>? members;
  Member? selectedMember;

Future<List<Member>> fetchMembers() async {
  try {
    const url = "https://dummyjson.com/users";
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body) as Map<String, dynamic>;
    final users = body['users'] as List<dynamic>;
    return users
        .map<Member>((json) => Member.fromJson(json as Map<String, dynamic>))
        .toList();
  } catch (e) {
    throw Exception('Failed to load members');
  }
}

  Future<List<Member>> getMembers() async {
    members = await fetchMembers();
    if (members != null) {
      return members!;
    } else {
      throw Exception('Failed to load members');
    }
  }

Future<Member> selectMember(int id) async {
  if (members == null) {
    await getMembers();
  }
  selectedMember = members?.firstWhere((member) => member.id == id);
  return Future.value(selectedMember);
}
}
