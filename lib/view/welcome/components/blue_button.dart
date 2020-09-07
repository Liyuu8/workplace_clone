import 'package:flutter/material.dart';

// utils
import 'package:workplace_clone/utils/styles.dart';

class BlueButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isContentEmpty;
  BlueButton({
    @required this.title,
    @required this.onPressed,
    this.isContentEmpty = false,
  });

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
      color: isContentEmpty ? Colors.grey : Colors.blueAccent,
      textColor: Colors.white,
      onPressed: isContentEmpty ? null : onPressed,
    );
  }
}
