import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// components
import 'package:workplace_clone/view/common/components/circle_photo.dart';

// screens
import 'package:workplace_clone/view/feed/screens/post_to_group_screen.dart';

// view models
import 'package:workplace_clone/view_models/feed_view_model.dart';

class CreatePostChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);
    final currentUser = feedViewModel.currentUser;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 8.0),
          ListTile(
            leading: CirclePhoto(
              photoUrl: currentUser.photoUrl,
              isImageFromFile: false,
              initialLetter: currentUser.fullName.substring(0, 1),
              radius: 20.0,
            ),
            title: ChoiceChip(
              label: Wrap(
                children: [
                  Text(S.of(context).createPostInput),
                  SizedBox(width: double.infinity),
                ],
              ),
              padding: const EdgeInsets.all(8.0),
              backgroundColor: Colors.white10,
              selected: false,
              onSelected: (_) => _openPostToGroupScreen(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(),
          ),
          Row(
            children: [
              SizedBox(width: 10.0),
              ChoiceChip(
                avatar: Icon(Icons.photo, color: Colors.green),
                label: Text(S.of(context).photo),
                padding: const EdgeInsets.all(8.0),
                backgroundColor: Colors.white10,
                selected: false,
                onSelected: (_) => null, // TODO:
              ),
              SizedBox(width: 10.0),
              ChoiceChip(
                avatar: Icon(Icons.person_add, color: Colors.blue),
                label: Text(S.of(context).tag),
                padding: const EdgeInsets.all(8.0),
                backgroundColor: Colors.white10,
                selected: false,
                onSelected: (_) => null, // TODO:
              ),
              SizedBox(width: 10.0),
              ChoiceChip(
                avatar: Icon(Icons.poll, color: Colors.orange),
                label: Text(S.of(context).poll),
                padding: const EdgeInsets.all(8.0),
                backgroundColor: Colors.white10,
                selected: false,
                onSelected: (_) => null, // TODO:
              ),
              SizedBox(width: 10.0),
            ],
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }

  _openPostToGroupScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PostToGroupScreen()),
    );
  }
}
