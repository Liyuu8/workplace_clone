import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

// data models
import 'package:workplace_clone/data_models/post.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// utils
import 'package:workplace_clone/utils/constants.dart';

// utils
import 'package:workplace_clone/utils/functions.dart';
import 'package:workplace_clone/utils/styles.dart';

// components
import 'package:workplace_clone/view/common/components/circle_photo.dart';
import 'package:workplace_clone/view/post/components/post_card_button.dart';

// screens
import 'package:workplace_clone/view/profile/screens/profile_screen.dart';

// view models
import 'package:workplace_clone/view_models/post_view_model.dart';

class PostCardTile extends StatelessWidget {
  final Post post;
  PostCardTile({@required this.post});

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context, listen: false);
    final currentUserId = postViewModel.currentUser.userId;
    final postUserId = post.userId;

    return FutureBuilder(
      future: postViewModel.getPostUserInfoAndPostedGroupName(post),
      builder: (context, AsyncSnapshot<List<String>> snapshot) => snapshot
                  .hasData &&
              snapshot.data != null &&
              snapshot.data.isNotEmpty
          ? Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: InkWell(
                      onTap: () => _openProfileScreen(
                        context,
                        currentUserId,
                        postUserId,
                      ),
                      child: CirclePhoto(
                        photoUrl: snapshot.data[0],
                        isImageFromFile: false,
                        initialLetter: snapshot.data[1].substring(0, 1),
                        initialLetterTextStyle: kPostIconInitialTextStyle,
                        radius: 20.0,
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Wrap(
                        children: [
                          Text(snapshot.data[1], style: kMainLabelTextStyle),
                          SizedBox(width: 0.5),
                          Icon(Icons.arrow_right),
                          SizedBox(width: 0.5),
                          Text(snapshot.data[2], style: kMainLabelTextStyle),
                        ],
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          createTimeAgoString(post.postDateTime) + '  •  ',
                          style: kDetailLabelTextStyle,
                        ),
                        Icon(Icons.group, size: 16.0),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.more_horiz),
                      onPressed: () => Fluttertoast.showToast(
                        msg: S.of(context).notImplement,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Fluttertoast.showToast(
                      msg: S.of(context).comingSoon,
                    ),
                    // TODO: RichTextの実装
                    // https://github.com/Liyuu8/insta_clone/blob/master/lib/view/common/components/comment_rich_text.dart
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(post.content, style: kPostContentTextStyle),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PostCardButton(
                          iconData: Icons.thumb_up,
                          buttonText: S.of(context).like,
                          onTap: () => Fluttertoast.showToast(
                            msg: S.of(context).comingSoon,
                          ), // TODO: いいね機能の実装
                        ),
                      ),
                      Expanded(
                        child: PostCardButton(
                          iconData: Icons.comment,
                          buttonText: S.of(context).comment,
                          onTap: () => Fluttertoast.showToast(
                            msg: S.of(context).comingSoon,
                          ), // TODO: コメント機能の実装
                        ),
                      ),
                      Expanded(
                        child: PostCardButton(
                          iconData: Icons.share,
                          buttonText: S.of(context).share,
                          onTap: () => Fluttertoast.showToast(
                            msg: S.of(context).comingSoon,
                          ), // TODO: 共有機能の実装
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Container(),
    );
  }

  _openProfileScreen(
    BuildContext context,
    String currentUserId,
    String postUserId,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProfileScreen(
          profileMode: postUserId == currentUserId
              ? ProfileMode.MYSELF
              : ProfileMode.OTHER,
        ),
      ),
    );
  }
}
