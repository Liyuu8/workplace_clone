import 'package:flutter/material.dart';

// data models
import 'package:workplace_clone/data_models/group.dart';

class GroupScreen extends StatelessWidget {
  final Group group;
  GroupScreen({@required this.group});

  @override
  Widget build(BuildContext context) {
    // TODO:
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('TODO: GroupScreen'),
            Text('groupName is ${group.name}'),
          ],
        ),
      ),
    );
  }
}
