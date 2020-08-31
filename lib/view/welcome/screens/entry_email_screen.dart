import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// styles
import 'package:workplace_clone/styles.dart';

// utils
import 'package:workplace_clone/utils/constants.dart';

// components
import 'package:workplace_clone/view/welcome/components/blue_button.dart';

// screens
import 'package:workplace_clone/view/welcome/screens/entry_user_details_screen.dart';
import 'package:workplace_clone/view/welcome/screens/entry_password_screen.dart';

// view models
import 'package:workplace_clone/view_models/welcome_view_model.dart';

class EntryEmailScreen extends StatefulWidget {
  final SignUpOrLogInMode mode;
  EntryEmailScreen({this.mode});

  @override
  _EntryEmailScreenState createState() => _EntryEmailScreenState();
}

class _EntryEmailScreenState extends State<EntryEmailScreen> {
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
                onPressed: () => widget.mode == SignUpOrLogInMode.SIGN_UP
                    ? _openEntryUserDetailsScreen(context)
                    : _openEntryPasswordScreen(context),
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

  _openEntryUserDetailsScreen(BuildContext context) {
    // TODO: 認証コード検証の実装
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EntryUserDetailsScreen()),
    );
  }

  _openEntryPasswordScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EntryPasswordScreen()),
    );
  }
}
