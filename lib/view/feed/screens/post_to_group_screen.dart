import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// utils
import 'package:workplace_clone/utils/constants.dart';

// utils
import 'package:workplace_clone/utils/styles.dart';

// components
import 'package:workplace_clone/view/common/components/circle_photo.dart';
import 'package:workplace_clone/view/feed/components/group_detail_list.dart';
import 'package:workplace_clone/view/feed/components/search_groups.dart';

// screens
import 'package:workplace_clone/view/post/screens/create_post_screen.dart';

// view models
import 'package:workplace_clone/view_models/feed_view_model.dart';

class PostToGroupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);
    Future(() => feedViewModel.getGroups());

    return Scaffold(
      appBar: AppBar(),
      body: Consumer<FeedViewModel>(
        builder: (context, model, child) => model.isProcessing
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 18.0,
                        horizontal: 12.0,
                      ),
                      child: SearchGroups(onSearch: (_) => null), // TODO:
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        S.of(context).yourTopGroups,
                        style: kGroupTitleTextStyle,
                      ),
                    ),
                    GroupDetailList(),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        S.of(context).yourTimeline,
                        style: kGroupTitleTextStyle,
                      ),
                    ),
                    InkWell(
                      onTap: () => _openPostScreen(context),
                      child: ListTile(
                        leading: CirclePhoto(
                          photoUrl: model.currentUser.photoUrl,
                          isImageFromFile: false,
                          initialLetter:
                              model.currentUser.fullName.substring(0, 1),
                        ),
                        title: Text(model.currentUser.fullName),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  _openPostScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CreatePostScreen(postFrom: PostFrom.FEED, group: null),
      ),
    );
  }
}
