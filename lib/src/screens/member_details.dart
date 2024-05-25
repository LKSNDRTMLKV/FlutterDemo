import 'package:bookstore/src/data/member.dart';
import 'package:bookstore/src/widgets/members/index.dart';
import 'package:flutter/material.dart';

class MemberDetailsScreen extends StatelessWidget {
  final AsyncSnapshot<Member> snapshot;
  const MemberDetailsScreen({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      final member = snapshot.data;
      if (member == null) {
        return const Scaffold(
          body: Center(
            child: Text('No member found.'),
          ),
        );
      }
      return Scrollbar(
          child: Scaffold(
              appBar: AppBar(
                title: Text('${member.firstName} ${member.lastName}'),
              ),
              body: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    // Use a two-column layout for larger screens
                    return Row(
                      children: [
                        Expanded(child: MemberInfo(member: member)),
                        Expanded(child: MemberModelsInfo(member: member)),
                      ],
                    );
                  } else {
                    // Use a one-column layout for smaller screens
                    return Column(
                      children: [
                        MemberInfo(member: member),
                        MemberModelsInfo(member: member),
                      ],
                    );
                  }
                },
              )));
    }
  }
}

class MemberInfo extends StatelessWidget {
  final Member member;

  const MemberInfo({
    required this.member,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(member.image),
              Text('Email: ${member.email}'),
              Text('Phone: ${member.phone}'),
              Text('Username: ${member.username}'),
              Text('Password: ${member.password}'),
              Text('Birth Date: ${member.birthDate}'),
              Text('Blood Group: ${member.bloodGroup}'),
              Text('Height: ${member.height.toString()}'),
              Text('Weight: ${member.weight.toString()}'),
              Text('Eye Color: ${member.eyeColor}'),
              Text('Hair Color: ${member.hairColor}'),
              Text('Hair Type: ${member.hairType}'),
              Text('IP: ${member.ip}'),
              Text('Mac Address: ${member.macAddress}'),
              Text('University: ${member.university}'),
              Text('EIN: ${member.ein}'),
              Text('SSN: ${member.ssn}'),
              Text('Role: ${member.role}'),
            ],
          ),
        ),
      ),
    );
  }
}

class MemberModelsInfo extends StatelessWidget {
  final Member member;

  const MemberModelsInfo({required this.member, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [AddressWidget(address: member.address)],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [BankWidget(bank: member.bank)],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CompanyWidget(company: member.company)],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CryptoWidget(crypto: member.crypto)],
          ),
        ],
      ),
    );
  }
}
