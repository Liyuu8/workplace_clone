import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// data models
import 'package:workplace_clone/data_models/group.dart';

// utils
import 'package:workplace_clone/utils/constants.dart';

// components
import 'package:workplace_clone/view/feed/components/group_detail_card.dart';

// screens
import 'package:workplace_clone/view/post/screens/create_post_screen.dart';

// view models
import 'package:workplace_clone/view_models/feed_view_model.dart';

class GroupDetailList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);
    return FutureBuilder(
      future: feedViewModel.getGroupMemberUserIds(),
      builder: (context, AsyncSnapshot<Map<String, List<String>>> snapshot) =>
          snapshot.hasData && snapshot.data != null
              ? ListView.builder(
                  itemCount: feedViewModel.groups.length,
                  itemBuilder: (context, index) {
                    final group = feedViewModel.groups[index];
                    final memberUserIds = snapshot.data[group.groupId];
                    return InkWell(
                      onTap: () => _openPostScreen(context, group),
                      child: GroupDetailCard(
                        title: group.name,
                        subTitle: '${group.privacy} group･'
                            '${memberUserIds.length.toString()} member',
                        photoUrl: group.photoUrl,
                      ),
                    );
                  },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: CircularProgressIndicator(),
                  ),
                ),
    );
  }

  _openPostScreen(BuildContext context, Group group) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CreatePostScreen(postFrom: PostFrom.FEED, group: group),
      ),
    );
  }
}
