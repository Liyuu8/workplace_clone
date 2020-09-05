import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// utils
import 'package:workplace_clone/utils/constants.dart';
import 'package:workplace_clone/utils/keys.dart';
import 'package:workplace_clone/utils/styles.dart';

// components
import 'package:workplace_clone/view/welcome/components/blue_button.dart';

// screens
import 'package:workplace_clone/view/welcome/screens/progressing_screen.dart';

// view models
import 'package:workplace_clone/view_models/welcome_view_model.dart';

class EntryPasswordScreen extends StatefulWidget {
  @override
  _EntryPasswordScreenState createState() => _EntryPasswordScreenState();
}

class _EntryPasswordScreenState extends State<EntryPasswordScreen> {
  TextEditingController _passwordEditController = TextEditingController();
  bool _showPassword = false;

  @override
  void initState() {
    _passwordEditController.addListener(_onPasswordChanged);
    super.initState();
  }

  @override
  void dispose() {
    _passwordEditController.dispose();
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
                S.of(context).enterPassword,
                style: kWelcomeLabelTextStyle,
              ),
            ),
            SizedBox(height: 28.0),
            TextField(
              key: passwordFieldKey,
              controller: _passwordEditController,
              style: kWelcomeInputTextStyle,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: S.of(context).enterPasswordInput,
                suffixIcon: IconButton(
                  icon: Icon(
                    _showPassword
                        ? FontAwesomeIcons.solidEye
                        : FontAwesomeIcons.solidEyeSlash,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    this.setState(() => _showPassword = !_showPassword);
                  },
                ),
              ),
              obscureText: !_showPassword,
            ),
            SizedBox(height: 28.0),
            Consumer<WelcomeViewModel>(
              builder: (context, model, child) => BlueButton(
                title: S.of(context).continueButton,
                isContentEmpty: model.isPasswordEmpty(),
                onPressed: () => _openProcessingScreen(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  _onPasswordChanged() {
    final welcomeViewModel = context.read<WelcomeViewModel>();
    welcomeViewModel.updatePasswordField(_passwordEditController.text);
  }

  _openProcessingScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProgressingScreen(mode: SignUpOrLogInMode.LOG_IN),
      ),
    );
  }
}
