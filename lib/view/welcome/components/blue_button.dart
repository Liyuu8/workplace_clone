import 'package:flutter/material.dart';

// utils
import 'package:workplace_clone/utils/styles.dart';

class BlueButton extends StatelessWidget {
  final String title;
  final bool isContentEmpty;
  final VoidCallback onPressed;
  BlueButton({
    @required this.title,
    @required this.isContentEmpty,
    @required this.onPressed,
  });

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
      color: isContentEmpty ? Colors.grey : Colors.blueAccent,
      textColor: Colors.white,
      onPressed: isContentEmpty ? null : onPressed,
    );
  }
}
