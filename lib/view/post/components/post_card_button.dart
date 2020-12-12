import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostCardButton extends StatelessWidget {
  final IconData iconData;
  final String buttonText;
  final VoidCallback onTap;
  final bool withColor;
  PostCardButton({
    @required this.iconData,
    @required this.buttonText,
    @required this.onTap,
    this.withColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            withColor
                ? FaIcon(iconData, color: Colors.blueAccent)
                : FaIcon(iconData),
            SizedBox(width: 8.0),
            withColor
                ? Text(buttonText, style: TextStyle(color: Colors.blueAccent))
                : Text(buttonText),
          ],
        ),
      ),
    );
  }
}
