import 'package:flutter/material.dart';

class ProfileMenuChip extends StatelessWidget {
  final IconData iconData;
  final String menuText;
  final VoidCallback onPressed;
  ProfileMenuChip({
    @required this.iconData,
    @required this.menuText,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(icon: Icon(iconData), onPressed: onPressed),
        Text(menuText),
      ],
    );
  }
}
