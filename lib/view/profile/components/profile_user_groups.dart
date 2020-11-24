import 'package:flutter/material.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// utils
import 'package:workplace_clone/utils/styles.dart';

class ProfileUserGroups extends StatelessWidget {
  final int userGroupNumber;
  ProfileUserGroups({@required this.userGroupNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).groups, style: kProfileMainLabelTextStyle),
          SizedBox(height: 8.0),
          Text(
            userGroupNumber.toString() + S.of(context).spaceGroups,
            style: kProfileSubLabelTextStyle,
          ),
          // TODO: グループ情報を横スクロールのカードで表示する
          // https://flutter.dev/docs/cookbook/lists/horizontal-list
        ],
      ),
    );
  }
}
