import 'package:flutter/material.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// styles
import 'package:workplace_clone/styles.dart';

// components
import 'package:workplace_clone/view/welcome/components/transparent_button.dart';
import 'package:workplace_clone/view/welcome/components/white_button.dart';

// screens
import 'package:workplace_clone/view/welcome/screens/login_screen.dart';
import 'package:workplace_clone/view/welcome/screens/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
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
      MaterialPageRoute(builder: (_) => SignUpScreen()),
    );
  }

  _openLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }
}
