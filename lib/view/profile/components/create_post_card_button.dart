import 'package:flutter/material.dart';

class CreatePostCardButton extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String buttonText;
  final VoidCallback onTap;
  CreatePostCardButton({
    @required this.iconData,
    @required this.iconColor,
    @required this.buttonText,
    @required this.onTap,
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
            Icon(iconData, color: iconColor),
            SizedBox(width: 8.0),
            Text(buttonText),
          ],
        ),
      ),
    );
  }
}
