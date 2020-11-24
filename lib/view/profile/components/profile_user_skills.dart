import 'package:flutter/material.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// utils
import 'package:workplace_clone/utils/styles.dart';

// screens
import 'package:workplace_clone/view/profile/screens/edit_profile_screen.dart';

class ProfileUserSkills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.of(context).skills, style: kProfileMainLabelTextStyle),
              FlatButton(
                onPressed: () => _openEditProfileScreen(context),
                child: Text(S.of(context).edit),
              ),
            ],
          ),
          Text(
            '0' + S.of(context).spaceEntries,
            style: kProfileSubLabelTextStyle,
          ),
        ],
      ),
    );
  }

  _openEditProfileScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EditProfileScreen()),
    );
  }
}
