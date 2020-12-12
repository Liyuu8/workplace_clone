import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:workplace_clone/data_models/app_user.dart';

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
import 'package:workplace_clone/view_models/feed_view_model.dart';

class PostCardTile extends StatelessWidget {
  final Post post;
  PostCardTile({@required this.post});

  @override
  Widget build(BuildContext context) {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);

    return FutureBuilder(
      future: feedViewModel.getPostInfo(post),
      builder: (context, AsyncSnapshot<PostUserInfo> snapshot) =>
          snapshot.hasData && snapshot.data != null
              ? Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: InkWell(
                          onTap: () => _openProfileScreen(
                            context,
                            feedViewModel.currentUser,
                            snapshot.data.postUser,
                          ),
                          child: CirclePhoto(
                            photoUrl: snapshot.data.postUser.photoUrl,
                            isImageFromFile: false,
                            initialLetter:
                                snapshot.data.postUser.fullName.substring(0, 1),
                            initialLetterTextStyle: kPostIconInitialTextStyle,
                            radius: 20.0,
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Wrap(
                            children: [
                              Text(
                                snapshot.data.postUser.fullName,
                                style: kMainLabelTextStyle,
                              ),
                              SizedBox(width: 0.5),
                              Icon(Icons.arrow_right),
                              SizedBox(width: 0.5),
                              Text(
                                snapshot.data.postedGroupName,
                                style: kMainLabelTextStyle,
                              ),
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
                          child: Text(
                            post.content,
                            style: kPostContentTextStyle,
                          ),
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
    AppUser currentUser,
    AppUser postUser,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProfileScreen(
          profileMode: postUser.userId == currentUser.userId
              ? ProfileMode.MYSELF
              : ProfileMode.OTHER,
          selectedUser: postUser,
        ),
      ),
    );
  }
}
