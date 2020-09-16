import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// components
import 'package:workplace_clone/view/feed/components/create_post_chips.dart';

// view models
import 'package:workplace_clone/view_models/feed_view_model.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);
    Future(() => feedViewModel.getMyselfAndFollowingUsersAndGroupPosts());

    return Container(
      color: Colors.black12,
      child: Consumer<FeedViewModel>(
        builder: (context, model, child) => feedViewModel.isProcessing
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () =>
                    feedViewModel.getMyselfAndFollowingUsersAndGroupPosts(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CreatePostChips(),
                      SizedBox(height: 8.0),
                      // TODO: 以下、投稿リストを表示する
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
