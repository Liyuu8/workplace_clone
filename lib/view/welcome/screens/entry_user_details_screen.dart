import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// styles
import 'package:workplace_clone/styles.dart';

// utils
import 'package:workplace_clone/utils/constants.dart';

// components
import 'package:workplace_clone/view/welcome/components/blue_button.dart';
import 'package:workplace_clone/view/welcome/components/text_field_by_bottom_sheet.dart';

// screens
import 'package:workplace_clone/view/welcome/screens/progressing_screen.dart';

// view models
import 'package:workplace_clone/view_models/welcome_view_model.dart';

class EntryUserDetailsScreen extends StatefulWidget {
  @override
  _EntryUserDetailsScreenState createState() => _EntryUserDetailsScreenState();
}

class _EntryUserDetailsScreenState extends State<EntryUserDetailsScreen> {
  bool _showPassword = false;
  TextEditingController _fullNameEditController = TextEditingController();
  TextEditingController _passwordEditController = TextEditingController();
  TextEditingController _organizationNameEditController =
      TextEditingController();

  @override
  void initState() {
    _fullNameEditController.addListener(
      () => _onEntryChanged(
        _fullNameEditController.text,
        UserDetailEntryFieldLabel.FULL_NAME,
      ),
    );
    _passwordEditController.addListener(
      () => _onEntryChanged(
        _passwordEditController.text,
        UserDetailEntryFieldLabel.PASSWORD,
      ),
    );
    _organizationNameEditController.addListener(
      () => _onEntryChanged(
        _organizationNameEditController.text,
        UserDetailEntryFieldLabel.ORGANIZATION_NAME,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _fullNameEditController.dispose();
    _passwordEditController.dispose();
    _organizationNameEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                S.of(context).enterYourDetails,
                style: kWelcomeLabelTextStyle,
              ),
              SizedBox(height: 30.0),
              Text(
                S.of(context).fullName,
                style: kWelcomeDetailsLabelTextStyle,
              ),
              TextField(
                controller: _fullNameEditController,
                style: kWelcomeDetailsInputTextStyle,
                decoration: InputDecoration(
                  hintText: S.of(context).fullNameInput,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                S.of(context).password,
                style: kWelcomeDetailsLabelTextStyle,
              ),
              TextField(
                controller: _passwordEditController,
                style: kWelcomeDetailsInputTextStyle,
                decoration: InputDecoration(
                  hintText: S.of(context).passwordInput,
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
              SizedBox(height: 6.0),
              Text(
                S.of(context).passwordDetail,
                style: kWelcomeDetailsTextStyle,
              ),
              SizedBox(height: 24.0),
              Text(
                S.of(context).organizationName,
                style: kWelcomeDetailsLabelTextStyle,
              ),
              TextField(
                controller: _organizationNameEditController,
                style: kWelcomeDetailsInputTextStyle,
                decoration: InputDecoration(
                  hintText: S.of(context).organizationNameInput,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                S.of(context).organizationSize,
                style: kWelcomeDetailsLabelTextStyle,
              ),
              Consumer<WelcomeViewModel>(
                builder: (context, model, child) => TextFieldByBottomSheet(
                  content: model.organizationSize == ''
                      ? S.of(context).organizationSizeInput
                      : model.organizationSize,
                  isContentEmpty: model.organizationSize == '',
                  contentTitle: S.of(context).organizationSizeInput,
                  contentChoiceList: [
                    S.of(context).organizationSizeChoice1,
                    S.of(context).organizationSizeChoice2,
                    S.of(context).organizationSizeChoice3,
                    S.of(context).organizationSizeChoice4,
                    S.of(context).organizationSizeChoice5,
                  ],
                  contentType: BottomSheetContentType.ORGANIZATION_SIZE,
                ),
              ),
              Text(
                S.of(context).organizationSizeDetail,
                style: kWelcomeDetailsTextStyle,
              ),
              SizedBox(height: 24.0),
              Text(
                S.of(context).jobTitle,
                style: kWelcomeDetailsLabelTextStyle,
              ),
              Consumer<WelcomeViewModel>(
                builder: (context, model, child) => TextFieldByBottomSheet(
                  content: model.jobTitle == ''
                      ? S.of(context).jobTitleInput
                      : model.jobTitle,
                  isContentEmpty: model.jobTitle == '',
                  contentTitle: S.of(context).jobTitleInput,
                  contentChoiceList: [
                    S.of(context).jobTitleChoice1,
                    S.of(context).jobTitleChoice2,
                    S.of(context).jobTitleChoice3,
                    S.of(context).jobTitleChoice4,
                    S.of(context).jobTitleChoice5,
                    S.of(context).jobTitleChoice6,
                  ],
                  contentType: BottomSheetContentType.JOB_TITLE,
                ),
              ),
              SizedBox(height: 32.0),
              Text(
                S.of(context).createAccountDetail,
                style: kWelcomeDetailsTextStyle,
              ),
              SizedBox(height: 20.0),
              Consumer<WelcomeViewModel>(
                builder: (context, model, child) => BlueButton(
                  title: S.of(context).continueButton,
                  isContentEmpty: model.isUserEntryDetailsEmpty(),
                  onPressed: () => _openProcessingScreen(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onEntryChanged(String entryText, UserDetailEntryFieldLabel fieldLabel) {
    final welcomeViewModel = context.read<WelcomeViewModel>();
    welcomeViewModel.updateUserEntryDetails(entryText, fieldLabel);
  }

  _openProcessingScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProgressingScreen(mode: SignUpOrLogInMode.SIGN_UP),
      ),
    );
  }
}
