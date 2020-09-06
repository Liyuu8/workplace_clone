import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final welcomeViewModel =
        Provider.of<WelcomeViewModel>(context, listen: false);

    // TODO:
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: Text(S.of(context).appTitle)),
          Center(child: Text('UserId: ${welcomeViewModel.currentUser.userId}')),
          Center(
            child: Text(
              'OrganizationId: ${welcomeViewModel.usersOrganization.organizationId}',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
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

  _signOut(BuildContext context) async {
    final welcomeViewModel = context.read<WelcomeViewModel>();
    welcomeViewModel.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => WelcomeScreen()),
    );
  }
}
