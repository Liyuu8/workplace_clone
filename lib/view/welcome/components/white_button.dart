import 'package:flutter/material.dart';

// styles
import 'package:workplace_clone/styles.dart';

class WhiteButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  WhiteButton({@required this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(title, style: kWelcomeButtonTextStyle),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      color: Colors.white,
      onPressed: onPressed,
    );
  }
}
