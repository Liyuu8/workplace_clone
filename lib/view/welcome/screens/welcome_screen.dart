import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// utils
import 'package:workplace_clone/utils/constants.dart';
import 'package:workplace_clone/utils/styles.dart';

// components
import 'package:workplace_clone/view/welcome/components/transparent_button.dart';
import 'package:workplace_clone/view/welcome/components/white_button.dart';

// screens
import 'package:workplace_clone/view/welcome/screens/entry_email_screen.dart';

// view model
import 'package:workplace_clone/view_models/welcome_view_model.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    _useDynamicLink();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(kWorkplaceMainColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 80.0,
                top: 16.0,
                right: 80.0,
              ),
              child: Image(
                image: AssetImage('assets/images/logo.png'),
                color: Colors.white,
              ),
            ),
            // TODO: PageView の実装
            // 【参考】https://medium.com/@adekoyeajayi/flutter-welcome-screen-with-pageview-624e20001bdb
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  WhiteButton(
                    title: S.of(context).signUpButton,
                    onPressed: () => _openSignUpScreen(context),
                  ),
                  SizedBox(height: 12.0),
                  TransparentButton(
                    title: S.of(context).logInButton,
                    onPressed: () => _openLoginScreen(context),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _openSignUpScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EntryEmailScreen(mode: SignUpOrLogInMode.SIGN_UP),
      ),
    );
  }

  _openLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EntryEmailScreen(mode: SignUpOrLogInMode.LOG_IN),
      ),
    );
  }

  _useDynamicLink() async {
    FirebaseDynamicLinks.instance.onLink(
      onSuccess: (PendingDynamicLinkData dynamicLink) async {
        _openInvitedSignUpScreen(context, dynamicLink);
      },
      onError: (OnLinkErrorException e) async {
        print('WelcomeScreen._useDynamicLink: ${e.message}');
      },
    );

    final dynamicLink = await FirebaseDynamicLinks.instance.getInitialLink();
    _openInvitedSignUpScreen(context, dynamicLink);
  }

  _openInvitedSignUpScreen(
    BuildContext context,
    PendingDynamicLinkData dynamicLink,
  ) async {
    if (dynamicLink == null) {
      return;
    }
    // [issue] https://github.com/FirebaseExtended/flutterfire/issues/1740
    // final organizationId = dynamicLink.link.queryParameters['organizationId'];
    final organizationId = dynamicLink.link.toString().split('/').last;
    final welcomeViewModel = context.read<WelcomeViewModel>();
    if (!(await welcomeViewModel.isOrganizationExisted(organizationId))) {
      return;
    }
    welcomeViewModel.updateOrganizationId(organizationId);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EntryEmailScreen(
          mode: SignUpOrLogInMode.INVITED_SIGN_IN,
        ),
      ),
    );
  }
}
