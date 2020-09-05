import 'package:flutter/material.dart';

// utils
import 'package:workplace_clone/utils/styles.dart';

class TransparentButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  TransparentButton({@required this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(title, style: kWelcomeButtonTextStyle),
      ),
      shape: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
      ),
      textColor: Colors.white,
      onPressed: onPressed,
    );
  }
}
