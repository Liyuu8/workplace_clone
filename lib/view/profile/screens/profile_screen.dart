import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// data models
import 'package:workplace_clone/data_models/app_user.dart';

// utils
import 'package:workplace_clone/utils/constants.dart';
import 'package:workplace_clone/utils/styles.dart';

// components
import 'package:workplace_clone/view/common/components/circle_photo.dart';
import 'package:workplace_clone/view/post/components/post_card_tile.dart';
import 'package:workplace_clone/view/profile/components/create_post_card.dart';
import 'package:workplace_clone/view/profile/components/profile_user_actions.dart';
import 'package:workplace_clone/view/profile/components/profile_user_details.dart';
import 'package:workplace_clone/view/profile/components/profile_user_groups.dart';
import 'package:workplace_clone/view/profile/components/profile_user_skills.dart';

// view models
import 'package:workplace_clone/view_models/profile_view_model.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileMode profileMode;
  final AppUser selectedUser;
  ProfileScreen({@required this.profileMode, this.selectedUser});

  @override
  Widget build(BuildContext context) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    profileViewModel.setProfileUser(profileMode, selectedUser);
    Future(() => profileViewModel.getProfileUserPosts());
    Future(() => profileViewModel.getProfileUsersGroups());

    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ProfileViewModel>(
          builder: (context, model, child) => model.isProcessing
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 16.0),
                      Stack(
                        children: [
                          Center(
                            child: InkWell(
                              onTap: () => Fluttertoast.showToast(
                                msg: S.of(context).comingSoon,
                              ), // TODO: プロフィール画像を変更する
                              child: CirclePhoto(
                                photoUrl: model.profileUser.photoUrl,
                                isImageFromFile: false,
                                initialLetter:
                                    model.profileUser.fullName.substring(0, 1),
                                initialLetterTextStyle:
                                    kProfileIconInitialTextStyle,
                                radius: 80.0,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          model.profileUser.fullName,
                          style: kProfileUserNameTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ProfileUserActions(profileMode: profileMode),
                      Divider(),
                      ProfileUserDetails(
                        profileUser: model.profileUser,
                        usersOrganizationName: model.usersOrganization.name,
                      ),
                      Divider(),
                      ProfileUserSkills(),
                      Divider(),
                      ProfileUserGroups(userGroupNumber: model.groups.length),
                      SizedBox(
                        height: 8.0,
                        child: Container(color: Colors.black12),
                      ),
                      CreatePostCard(postUser: model.profileUser),
                      SizedBox(
                        height: 8.0,
                        child: Container(color: Colors.black12),
                      ),
                      ListView.builder(
                        itemCount: model.posts.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            PostCardTile(
                              post: model.posts[index],
                            ),
                            SizedBox(
                              height: 8.0,
                              child: Container(color: Colors.black12),
                            ),
                          ],
                        ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      ),
                    ],
                  ),
                )),
    );
  }
}
