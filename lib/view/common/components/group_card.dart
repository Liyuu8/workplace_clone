import 'package:flutter/material.dart';

// utils
import 'package:workplace_clone/utils/styles.dart';

// components
import 'package:workplace_clone/view/common/components/circle_photo.dart';

class GroupCard extends StatelessWidget {
  final String title;
  final String photoUrl;
  final bool isCheckboxExisted;
  final bool isChecked;
  final ValueChanged onCheckBoxChanged;
  final String subTitle;
  GroupCard({
    @required this.title,
    @required this.photoUrl,
    @required this.isCheckboxExisted,
    this.isChecked,
    this.onCheckBoxChanged,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: kChoiceLabelTextStyle),
      leading: CirclePhoto(
        photoUrl: photoUrl,
        isImageFromFile: true,
        initialLetter: title.substring(0, 1),
      ),
      subtitle: subTitle != null
          ? Text(subTitle, style: kChoiceLabelTextStyle)
          : null,
      trailing: isCheckboxExisted
          ? Checkbox(value: isChecked, onChanged: onCheckBoxChanged)
          : null,
    );
  }
}
