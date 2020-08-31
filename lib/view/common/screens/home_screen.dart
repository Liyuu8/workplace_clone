import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// view models
import 'package:workplace_clone/view_models/welcome_view_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final welcomeViewModel =
        Provider.of<WelcomeViewModel>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).appTitle),
            Text('UserId: ${welcomeViewModel.currentUser.userId}'),
            Text(
              'OrganizationId: ${welcomeViewModel.usersOrganization.organizationId}',
            ),
          ],
        ),
      ),
    );
  }
}
