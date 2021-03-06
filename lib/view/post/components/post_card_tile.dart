import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// data models
import 'package:workplace_clone/data_models/app_user.dart';
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
import 'package:workplace_clone/view/post/components/post_card_like_info.dart';

// screens
import 'package:workplace_clone/view/profile/screens/profile_screen.dart';

// view models
import 'package:workplace_clone/view_models/post_view_model.dart';

class PostCardTile extends StatelessWidget {
  final Post post;
  PostCardTile({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostViewModel>(
      builder: (context, model, child) => FutureBuilder(
        future: model.getPostInfo(post),
        builder: (
          context,
          AsyncSnapshot<PostInfo> snapshot,
        ) =>
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
                              model.currentUser,
                              snapshot.data.postUser,
                            ),
                            child: CirclePhoto(
                              photoUrl: snapshot.data.postUser.photoUrl,
                              isImageFromFile: false,
                              initialLetter: snapshot.data.postUser.fullName
                                  .substring(0, 1),
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
                                createTimeAgoString(post.postDateTime),
                                style: kDetailLabelTextStyle,
                              ),
                              SizedBox(width: 5.0),
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
                        snapshot.data.likeUserNameList.length != 0
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: PostCardLikeInfo(
                                  likeUserNameList:
                                      snapshot.data.likeUserNameList,
                                ),
                              )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Divider(),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: snapshot.data.isLikedToThisPost
                                  ? PostCardButton(
                                      iconData: FontAwesomeIcons.solidThumbsUp,
                                      buttonText: S.of(context).like,
                                      onTap: () => !model.isProcessing
                                          ? _unLikeIt(context, model)
                                          : null,
                                      withColor: true,
                                    )
                                  : PostCardButton(
                                      iconData: FontAwesomeIcons.thumbsUp,
                                      buttonText: S.of(context).like,
                                      onTap: () => !model.isProcessing
                                          ? _likeIt(context, model)
                                          : null,
                                      withColor: false,
                                    ),
                            ),
                            Expanded(
                              child: PostCardButton(
                                iconData: FontAwesomeIcons.comment,
                                buttonText: S.of(context).comment,
                                onTap: () => Fluttertoast.showToast(
                                  msg: S.of(context).comingSoon,
                                ), // TODO: コメント機能の実装
                              ),
                            ),
                            Expanded(
                              child: PostCardButton(
                                iconData: FontAwesomeIcons.share,
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
      ),
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

  _likeIt(BuildContext context, PostViewModel postViewModel) async =>
      await postViewModel.likeIt(post);

  _unLikeIt(BuildContext context, PostViewModel postViewModel) async =>
      await postViewModel.unLikeIt(post);
}
