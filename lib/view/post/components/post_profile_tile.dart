import 'package:flutter/material.dart';

// data models
import 'package:workplace_clone/data_models/app_user.dart';
import 'package:workplace_clone/data_models/group.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// utils
import 'package:workplace_clone/utils/styles.dart';

// components
import 'package:workplace_clone/view/common/components/circle_photo.dart';

class PostProfileTile extends StatelessWidget {
  final AppUser currentUser;
  final Group group;
  final String organizationName;
  PostProfileTile({
    @required this.currentUser,
    @required this.group,
    @required this.organizationName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CirclePhoto(
        photoUrl: currentUser.photoUrl,
        isImageFromFile: false,
        initialLetter: currentUser.fullName.substring(0, 1),
        radius: 26.0,
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Text(currentUser.fullName, style: kMainLabelTextStyle),
      ),
      subtitle: Row(
        children: [
          InkWell(
            onTap: () => null, // TODO:
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.security, size: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      group != null
                          ? S.of(context).membersOf + group.name
                          : organizationName,
                      style: kDetailLabelTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
