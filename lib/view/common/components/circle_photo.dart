import 'package:flutter/material.dart';

class CirclePhoto extends StatelessWidget {
  final String photoUrl;
  final bool isImageFromFile;
  final double radius;
  final String initialLetter;
  final TextStyle initialLetterTextStyle;
  CirclePhoto({
    this.photoUrl,
    this.isImageFromFile = true,
    this.radius,
    this.initialLetter,
    this.initialLetterTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: photoUrl == null
          ? null
          : isImageFromFile ? AssetImage(photoUrl) : Image.network(photoUrl),
      child: photoUrl == null
          ? Text(initialLetter, style: initialLetterTextStyle)
          : null,
    );
  }
}
