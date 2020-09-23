import 'package:flutter/material.dart';

class PostCardButton extends StatelessWidget {
  final IconData iconData;
  final String buttonText;
  final VoidCallback onTap;
  PostCardButton({
    @required this.iconData,
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
            Icon(iconData),
            SizedBox(width: 8.0),
            Text(buttonText),
          ],
        ),
      ),
    );
  }
}
