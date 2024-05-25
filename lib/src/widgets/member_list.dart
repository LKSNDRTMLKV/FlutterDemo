import 'package:flutter/material.dart';
import '../data.dart';
class MemberList extends StatelessWidget {
  final AsyncSnapshot<List<Member>> snapshot;
  final ValueChanged<Member>? onTap;

  const MemberList({
    required this.snapshot,
    this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      final members = snapshot.data;
      if (members == null || members.isEmpty) {
        return const Center(
          child: Text('No members found.'),
        );
      }
      return ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            '${members[index].firstName} ${members[index].lastName}',
          ),
          subtitle: Text(
            members[index].email,
          ),
          onTap: onTap != null ? () => onTap!(members[index]) : null,
        ),
      );
    }
  }
}
