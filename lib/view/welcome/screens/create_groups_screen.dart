import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// utils
import 'package:workplace_clone/utils/styles.dart';

// components
import 'package:workplace_clone/view/welcome/components/blue_button.dart';
import 'package:workplace_clone/view/common/components/group_card.dart';

// screens
import 'package:workplace_clone/view/welcome/screens/invite_people_screen.dart';

// view models
import 'package:workplace_clone/view_models/welcome_view_model.dart';

class CreateGroupsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final welcomeViewModel =
        Provider.of<WelcomeViewModel>(context, listen: false);
    final String organizationName = welcomeViewModel.usersOrganization.name;

    final List<String> groupTitleList = [
      S.of(context).createGroupsInsideChoice1,
      S.of(context).createGroupsInsideChoice2,
      S.of(context).createGroupsInsideChoice3,
      S.of(context).createGroupsInsideChoice4,
      S.of(context).createGroupsInsideChoiceMain,
    ];
    final List<String> groupPhotoUrlList = [
      'assets/images/group_company_announcements.jpg',
      'assets/images/group_marketing_team.jpg',
      'assets/images/group_company_social.jpg',
      'assets/images/group_project_updates.jpg',
      'assets/images/group_general.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            child: Text(S.of(context).skipButton, style: kFlatTextStyle),
            onPressed: () => _openInvitePeopleScreen(context, true),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  S.of(context).createGroupsInside + organizationName,
                  style: kWelcomeLabelTextStyle,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    S.of(context).createGroupsInsideDetail,
                    style: kWelcomeDetailTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ListView.builder(
                itemCount: groupTitleList.length,
                itemBuilder: (context, int index) => Column(
                  children: [
                    Consumer<WelcomeViewModel>(
                      builder: (context, model, child) {
                        final checkList = model.initialGroupCheckList;
                        return GroupCard(
                          title: groupTitleList[index],
                          photoUrl: groupPhotoUrlList[index],
                          isCheckboxExisted: index != checkList.length,
                          isChecked: index != checkList.length
                              ? checkList[index]
                              : false,
                          onCheckBoxChanged: index != checkList.length
                              ? (isChecked) =>
                                  _onCheckBoxChanged(context, index, isChecked)
                              : null,
                          subTitle: index == checkList.length
                              ? S.of(context).createGroupsInsideChoiceMainDetail
                              : null,
                        );
                      },
                    ),
                    Divider(),
                  ],
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: BlueButton(
                  title: S.of(context).createGroupsButton,
                  onPressed: () => _openInvitePeopleScreen(context, false),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onCheckBoxChanged(BuildContext context, int index, bool isChecked) {
    final welcomeViewModel = context.read<WelcomeViewModel>();
    welcomeViewModel.updateInitialGroupCheckList(index, isChecked);
  }

  _openInvitePeopleScreen(BuildContext context, bool isSkipped) {
    if (isSkipped) {
      final welcomeViewModel = context.read<WelcomeViewModel>();
      welcomeViewModel.skipInitialGroupCreated();
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => InvitePeopleScreen()),
    );
  }
}
