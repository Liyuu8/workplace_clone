import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// data models
import 'package:workplace_clone/data_models/group.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// utils
import 'package:workplace_clone/utils/constants.dart';
import 'package:workplace_clone/utils/styles.dart';

// components
import 'package:workplace_clone/view/post/components/post_profile_tile.dart';

// view models
import 'package:workplace_clone/view_models/post_view_model.dart';

class CreatePostScreen extends StatefulWidget {
  final PostFrom postFrom;
  final Group group;
  CreatePostScreen({@required this.postFrom, @required this.group});

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController _postEditController = TextEditingController();

  @override
  void initState() {
    _postEditController.addListener(_onPostChanged);
    super.initState();
  }

  @override
  void dispose() {
    _postEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context, listen: false);
    final organizationName = postViewModel.usersOrganization.name;
    final currentUser = postViewModel.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.group?.name ?? S.of(context).createPostTitle),
        actions: [
          Consumer<PostViewModel>(
            builder: (context, model, child) => FlatButton(
              child: Text(
                S.of(context).postButton,
                style: model.isPostEmpty()
                    ? kFlatButtonUnableTextStyle
                    : kFlatButtonEnableTextStyle,
              ),
              onPressed: model.isPostEmpty()
                  ? null
                  : () => _executePost(context, widget.postFrom),
            ),
          ),
        ],
      ),
      body: Consumer<PostViewModel>(
        builder: (context, model, child) => model.isProcessing
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 8.0),
                    PostProfileTile(
                      currentUser: currentUser,
                      group: widget.group,
                      organizationName: organizationName,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _postEditController,
                        style: kInputTextStyle,
                        decoration: InputDecoration(
                          hintText: S.of(context).whatYourMind,
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  _onPostChanged() {
    final postViewModel = context.read<PostViewModel>();
    postViewModel.updatePostField(_postEditController.text);
  }

  _executePost(BuildContext context, PostFrom postFrom) async {
    final postViewModel = context.read<PostViewModel>();
    await postViewModel.executePost(widget.group?.groupId ?? '');
    postViewModel.updatePostField('');

    postFrom == PostFrom.FEED
        ? Navigator.popUntil(context, (route) => route.isFirst)
        : Navigator.pop(context);
  }
}
