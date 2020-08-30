import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// screens
import 'package:workplace_clone/view/common/screens/home_screen.dart';

// components
import 'package:workplace_clone/view/welcome/components/blue_button.dart';

// view models
import 'package:workplace_clone/view_models/welcome_view_model.dart';

class SignUpProgressingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final welcomeViewModel =
        Provider.of<WelcomeViewModel>(context, listen: false);
    Future(() => welcomeViewModel.signUpAndCreateOrganization());

    return Scaffold(
      body: Consumer<WelcomeViewModel>(
        builder: (context, model, child) => model.isProgressing
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: CircularProgressIndicator()),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(S.of(context).createAccountProgressing),
                  ),
                ],
              )
            : model.isSuccessful
                // TODO: 以下、自動で画面遷移を実行したい...
                ? Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Text('Creating your account is Successful!'),
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
                          child: Text('Creating your account is failed.'),
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
