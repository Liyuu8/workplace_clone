import 'package:flutter/material.dart';

// utils
import 'package:workplace_clone/utils/styles.dart';

class CirclePhoto extends StatelessWidget {
  final String photoUrl;
  final bool isImageFromFile;
  final double radius;
  final String initialLetter;
  CirclePhoto({
    this.photoUrl,
    this.isImageFromFile = true,
    this.radius,
    this.initialLetter,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: photoUrl == null
          ? null
          : isImageFromFile ? AssetImage(photoUrl) : Image.network(photoUrl),
      child: photoUrl == null
          ? Text(initialLetter, style: kPostIconInitialTextStyle)
          : null,
    );
  }
}
