import 'package:flutter/material.dart';

class GroupDetailCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String photoUrl;
  GroupDetailCard({
    @required this.title,
    @required this.subTitle,
    @required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: photoUrl != null
            ? Image.asset(
                photoUrl,
                height: 45.0,
                width: 45.0,
                fit: BoxFit.cover,
              )
            : CircleAvatar(child: Text(title.substring(0, 1))),
      ),
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}
