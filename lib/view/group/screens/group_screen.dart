import 'package:flutter/material.dart';
import 'package:workplace_clone/generated/l10n.dart';

// data models
import 'package:workplace_clone/data_models/group.dart';

class GroupScreen extends StatelessWidget {
  final Group group;
  GroupScreen({@required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).notImplement),
            Text('groupName is ${group.name}'),
          ],
        ),
      ),
    );
  }
}
