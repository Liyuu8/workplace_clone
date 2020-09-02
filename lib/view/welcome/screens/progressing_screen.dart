import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// repositories
import 'package:workplace_clone/models/repositories/user_repository.dart';

// utils
import 'package:workplace_clone/utils/constants.dart';

// screens
import 'package:workplace_clone/view/common/screens/home_screen.dart';

// components
import 'package:workplace_clone/view/welcome/components/blue_button.dart';

// view models
import 'package:workplace_clone/view_models/welcome_view_model.dart';

class ProgressingScreen extends StatelessWidget {
  final SignUpOrLogInMode mode;
  ProgressingScreen({@required this.mode});

  @override
  Widget build(BuildContext context) {
    final welcomeViewModel =
        Provider.of<WelcomeViewModel>(context, listen: false);
    Future(
      () => mode == SignUpOrLogInMode.SIGN_UP
          ? welcomeViewModel.signUpAndCreateOrganization()
          : welcomeViewModel.logIn(),
    );

    return Scaffold(
      body: Consumer<WelcomeViewModel>(
        builder: (context, model, child) => model.status ==
                Status.Authenticating
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: CircularProgressIndicator()),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: mode == SignUpOrLogInMode.SIGN_UP
                        ? Text(S.of(context).createAccountProgressing)
                        : Text(S.of(context).loggingInProgressing),
                  ),
                ],
              )
            : model.status == Status.Authenticated
                // TODO: 以下、自動で画面遷移を実行したい...
                ? Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: mode == SignUpOrLogInMode.SIGN_UP
                              ? Text('Creating your account is Successful!')
                              : Text('Logging in your account is Successful!'),
                        ),
                        SizedBox(height: 16.0),
                        BlueButton(
                          title: S.of(context).continueButton,
                          isContentEmpty: false,
                          onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => HomeScreen()),
                            (_) => false,
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: mode == SignUpOrLogInMode.SIGN_UP
                              ? Text('Creating your account is failed.')
                              : Text('Logging in your account is failed.'),
                        ),
                        SizedBox(height: 16.0),
                        BlueButton(
                          title: S.of(context).continueButton,
                          isContentEmpty: false,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
