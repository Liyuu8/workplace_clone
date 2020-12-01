import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// components
import 'package:workplace_clone/view/welcome/components/blue_button.dart';

// screens
import 'package:workplace_clone/view/welcome/screens/welcome_screen.dart';

// view models
import 'package:workplace_clone/view_models/welcome_view_model.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: メニューページの実装
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 12.0,
              right: 24.0,
            ),
            child: BlueButton(
              title: S.of(context).invitePeople,
              isContentEmpty: false,
              onPressed: () => _invitePeople(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 12.0,
              right: 24.0,
            ),
            child: BlueButton(
              title: S.of(context).logOut,
              isContentEmpty: false,
              onPressed: () => _signOut(context),
            ),
          ),
        ],
      ),
    );
  }

  _invitePeople(BuildContext context) async {
    final welcomeViewModel = context.read<WelcomeViewModel>();
    final organizationId = welcomeViewModel.usersOrganization.organizationId;
    final packageInfo = await PackageInfo.fromPlatform();
    final parameters = DynamicLinkParameters(
      uriPrefix: 'https://workplaceclone.page.link',
      link: Uri.parse(
        'https://liyuu8.github.io/workplace_clone/$organizationId',
      ),
      androidParameters: AndroidParameters(
        packageName: packageInfo.packageName,
      ),
      iosParameters: IosParameters(
        bundleId: packageInfo.packageName,
      ),
    );
    final dynamicUrl = await parameters.buildUrl();
    Share.share(dynamicUrl.toString(), subject: 'メンバーを招待する'); // TODO: 多言語対応
  }

  _signOut(BuildContext context) async {
    final welcomeViewModel = context.read<WelcomeViewModel>();
    welcomeViewModel.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => WelcomeScreen()),
    );
  }
}
