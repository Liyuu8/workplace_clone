import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// data models
import 'package:workplace_clone/data_models/app_user.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// utils
import 'package:workplace_clone/utils/constants.dart';
import 'package:workplace_clone/utils/styles.dart';

// components
import 'package:workplace_clone/view/common/components/circle_photo.dart';
import 'package:workplace_clone/view/profile/components/create_post_card_button.dart';

// screens
import 'package:workplace_clone/view/post/screens/create_post_screen.dart';

class CreatePostCard extends StatelessWidget {
  final AppUser postUser;
  CreatePostCard({@required this.postUser});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(S.of(context).posts, style: kProfileMainLabelTextStyle),
        ),
        InkWell(
          onTap: () => _openPostScreen(context),
          child: ListTile(
            leading: CirclePhoto(
              photoUrl: postUser.photoUrl,
              isImageFromFile: false,
              initialLetter: postUser.fullName.substring(0, 1),
              initialLetterTextStyle: kPostIconInitialTextStyle,
              radius: 20.0,
            ),
            title: Text(S.of(context).whatYourMind),
          ),
        ),
        Divider(),
        Row(
          children: [
            Expanded(
              child: CreatePostCardButton(
                iconData: Icons.video_call,
                iconColor: Colors.red,
                buttonText: S.of(context).live,
                onTap: () => Fluttertoast.showToast(
                  msg: S.of(context).notImplement,
                ),
              ),
            ),
            Expanded(
              child: CreatePostCardButton(
                iconData: Icons.photo,
                iconColor: Colors.green,
                buttonText: S.of(context).photo,
                onTap: () => Fluttertoast.showToast(
                  msg: S.of(context).notImplement,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _openPostScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CreatePostScreen(
          postFrom: PostFrom.PROFILE,
          group: null,
        ),
      ),
    );
  }
}
