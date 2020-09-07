import 'package:flutter/material.dart';

// utils
import 'package:workplace_clone/utils/styles.dart';

class WhiteButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  WhiteButton({@required this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(title, style: kButtonTextStyle),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      color: Colors.white,
      onPressed: onPressed,
    );
  }
}
