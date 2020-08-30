import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// styles
import 'package:workplace_clone/styles.dart';

// components
import 'package:workplace_clone/view/welcome/components/blue_button.dart';

// screens
import 'package:workplace_clone/view/welcome/screens/user_entry_details_screen.dart';

// view models
import 'package:workplace_clone/view_models/welcome_view_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailEditController = TextEditingController();

  @override
  void initState() {
    _emailEditController.addListener(_onEmailChanged);
    super.initState();
  }

  @override
  void dispose() {
    _emailEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 28.0),
            Center(
              child: Text(
                S.of(context).enterEmail,
                style: kWelcomeLabelTextStyle,
              ),
            ),
            SizedBox(height: 28.0),
            TextField(
              controller: _emailEditController,
              style: kWelcomeInputTextStyle,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: S.of(context).enterEmailInput,
              ),
            ),
            SizedBox(height: 28.0),
            Consumer<WelcomeViewModel>(
              builder: (context, model, child) => BlueButton(
                title: S.of(context).continueButton,
                isContentEmpty: model.isEmailEmpty(),
                onPressed: () => _openEnterYourDetailsScreen(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  _onEmailChanged() {
    final welcomeViewModel = context.read<WelcomeViewModel>();
    welcomeViewModel.updateEmailField(_emailEditController.text);
  }

  _openEnterYourDetailsScreen(BuildContext context) {
    // TODO: 認証コード検証の実装
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => UserEntryDetailsScreen()),
    );
  }
}
