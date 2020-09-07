import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// utils
import 'package:workplace_clone/utils/styles.dart';

// screens
import 'package:workplace_clone/view/common/screens/home_screen.dart';

// components
import 'package:workplace_clone/view/welcome/components/blue_button.dart';

// view models
import 'package:workplace_clone/view_models/welcome_view_model.dart';

class InvitePeopleScreen extends StatefulWidget {
  @override
  _InvitePeopleScreenState createState() => _InvitePeopleScreenState();
}

class _InvitePeopleScreenState extends State<InvitePeopleScreen> {
  TextEditingController _someoneEmail1EditController = TextEditingController();
  TextEditingController _someoneEmail2EditController = TextEditingController();

  @override
  void initState() {
    final welcomeViewModel = context.read<WelcomeViewModel>();
    _someoneEmail1EditController.text = welcomeViewModel.someoneEmail1;
    _someoneEmail2EditController.text = welcomeViewModel.someoneEmail2;

    _someoneEmail1EditController.addListener(() => _onSomeoneEmailChanged(1));
    _someoneEmail2EditController.addListener(() => _onSomeoneEmailChanged(2));
    super.initState();
  }

  @override
  void dispose() {
    _someoneEmail1EditController.dispose();
    _someoneEmail2EditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final welcomeViewModel =
        Provider.of<WelcomeViewModel>(context, listen: false);
    final String organizationName = welcomeViewModel.usersOrganization.name;

    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            child: Text(S.of(context).skipButton, style: kFlatTextStyle),
            onPressed: () => _openHomeScreen(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  S.of(context).invitePeople + organizationName,
                  style: kWelcomeLabelTextStyle,
                ),
              ),
              SizedBox(height: 8.0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    S.of(context).invitePeopleDetail1,
                    style: kWelcomeDetailTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              TextField(
                controller: _someoneEmail1EditController,
                style: kWelcomeInputTextStyle,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: S.of(context).invitePeopleInput,
                ),
              ),
              SizedBox(height: 18.0),
              TextField(
                controller: _someoneEmail2EditController,
                style: kWelcomeInputTextStyle,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: S.of(context).invitePeopleInput,
                ),
              ),
              SizedBox(height: 80.0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    S.of(context).invitePeopleDetail2,
                    style: kWelcomeInvitePeopleDetailTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 4.0),
              Consumer<WelcomeViewModel>(
                builder: (context, model, child) => BlueButton(
                  title: S.of(context).doneButton,
                  onPressed: () => _openHomeScreen(context),
                  isContentEmpty: model.isSomeoneEmailEmpty(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onSomeoneEmailChanged(int index) {
    final welcomeViewModel = context.read<WelcomeViewModel>();
    welcomeViewModel.updateSomeoneEmailField(
      index == 1
          ? _someoneEmail1EditController.text
          : _someoneEmail2EditController.text,
      index,
    );
  }

  _openHomeScreen(BuildContext context) {
    final welcomeViewModel = context.read<WelcomeViewModel>();
    welcomeViewModel.initializeOrganizationSetting();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
      (_) => false,
    );
  }
}
