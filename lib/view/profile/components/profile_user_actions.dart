import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// utils
import 'package:workplace_clone/utils/constants.dart';

// components
import 'package:workplace_clone/view/profile/components/profile_menu_chip.dart';

// screens
import 'package:workplace_clone/view/profile/screens/edit_profile_screen.dart';

// view models
import 'package:workplace_clone/view_models/profile_view_model.dart';

class ProfileUserActions extends StatelessWidget {
  final ProfileMode profileMode;
  ProfileUserActions({@required this.profileMode});

  @override
  Widget build(BuildContext context) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    final isFollowing = profileViewModel.isFollowing;

    return Row(
      children: profileMode == ProfileMode.MYSELF
          ? [
              Expanded(
                child: ProfileMenuChip(
                  iconData: Icons.edit,
                  menuText: S.of(context).editProfile,
                  onPressed: () => _openEditProfileScreen(context),
                ),
              ),
              Expanded(
                child: ProfileMenuChip(
                  iconData: Icons.menu,
                  menuText: S.of(context).activityLog,
                  onPressed: () => Fluttertoast.showToast(
                    msg: S.of(context).notImplement,
                  ),
                ),
              ),
              Expanded(
                child: ProfileMenuChip(
                  iconData: Icons.more_horiz,
                  menuText: S.of(context).more,
                  onPressed: () => Fluttertoast.showToast(
                    msg: S.of(context).notImplement,
                  ),
                ),
              ),
            ]
          : [
              Expanded(
                child: isFollowing
                    ? ProfileMenuChip(
                        iconData: Icons.indeterminate_check_box,
                        menuText: S.of(context).unFollow,
                        onPressed: () => _unFollowProfileUser(context),
                      )
                    : ProfileMenuChip(
                        iconData: Icons.add_box,
                        menuText: S.of(context).follow,
                        onPressed: () => _followProfileUser(context),
                      ),
              ),
              Expanded(
                child: ProfileMenuChip(
                  iconData: Icons.message,
                  menuText: S.of(context).message,
                  onPressed: () => Fluttertoast.showToast(
                    msg: S.of(context).notImplement,
                  ),
                ),
              ),
              Expanded(
                child: ProfileMenuChip(
                  iconData: Icons.send,
                  menuText: S.of(context).sendThanks,
                  onPressed: () => Fluttertoast.showToast(
                    msg: S.of(context).notImplement,
                  ),
                ),
              ),
              Expanded(
                child: ProfileMenuChip(
                  iconData: Icons.more_horiz,
                  menuText: S.of(context).more,
                  onPressed: () => Fluttertoast.showToast(
                    msg: S.of(context).notImplement,
                  ),
                ),
              ),
            ],
    );
  }

  _openEditProfileScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EditProfileScreen()),
    );
  }

  _followProfileUser(BuildContext context) {
    final profileViewModel = context.read<ProfileViewModel>();
    profileViewModel.followProfileUser();
  }

  _unFollowProfileUser(BuildContext context) {
    final profileViewModel = context.read<ProfileViewModel>();
    profileViewModel.unFollowProfileUser();
  }
}
