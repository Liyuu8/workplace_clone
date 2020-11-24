import 'package:flutter/material.dart';

// data models
import 'package:workplace_clone/data_models/app_user.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// utils
import 'package:workplace_clone/utils/styles.dart';

// screens
import 'package:workplace_clone/view/profile/screens/edit_profile_screen.dart';

class ProfileUserDetails extends StatelessWidget {
  final AppUser profileUser;
  final String usersOrganizationName;
  ProfileUserDetails({
    @required this.profileUser,
    @required this.usersOrganizationName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openEditProfileScreen(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.group),
                SizedBox(width: 8.0),
                Text(
                  S.of(context).worksAt + usersOrganizationName,
                  style: kProfileLabelDetailTextStyle,
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.mail),
                SizedBox(width: 8.0),
                Text(
                  profileUser.email,
                  style: kProfileLabelDetailTextStyle,
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.more_horiz),
                SizedBox(width: 8.0),
                Text(
                  S.of(context).see +
                      profileUser.fullName +
                      S.of(context).aboutInfo,
                  style: kProfileLabelDetailTextStyle,
                ),
              ],
            ),
          ],
        ),
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
