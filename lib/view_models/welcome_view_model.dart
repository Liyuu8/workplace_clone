import 'package:flutter/material.dart';

// models
import 'package:workplace_clone/models/repositories/user_repository.dart';

// utils
import 'package:workplace_clone/utils/constants.dart';

class WelcomeViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  WelcomeViewModel({this.userRepository});

  bool isProgressing = false;
  bool isSuccessful = false;

  String email = '';
  String fullName = '';
  String password = '';
  String organizationName = '';
  String organizationSize = '';
  String jobTitle = '';
  String organizationId = '';

  Future<bool> isSignIn() async {
    return await userRepository.isSignIn();
  }

  Future<void> signUpAndCreateOrganization() async {
    isProgressing = true;
    notifyListeners();

    isSuccessful = await userRepository.signUpAndCreateOrganization(
      email,
      fullName,
      password,
      organizationName,
      organizationSize,
      jobTitle,
    );

    isProgressing = false;
    notifyListeners();
  }

  Future<void> signUpIntoExistingOrganization() async {
    isProgressing = true;
    notifyListeners();

    isSuccessful = await userRepository.signUpIntoExistingOrganization(
      email,
      password,
      organizationId,
    );

    isProgressing = false;
    notifyListeners();
  }

  Future<void> signIn() async {
    isProgressing = true;
    notifyListeners();

    isSuccessful = await userRepository.signIn(email, password);

    isProgressing = false;
    notifyListeners();
  }

  updateEmailField(String updatedEmail) {
    email = updatedEmail;
    notifyListeners();
  }

  bool isEmailEmpty() => email == '';

  updateTextFieldByBottomSheet(
    String content,
    BottomSheetContentType contentType,
  ) {
    contentType == BottomSheetContentType.ORGANIZATION_SIZE
        ? organizationSize = content
        : jobTitle = content;
    notifyListeners();
  }

  updateUserEntryDetails(
    String entryText,
    UserDetailEntryFieldLabel fieldLabel,
  ) {
    switch (fieldLabel) {
      case UserDetailEntryFieldLabel.FULL_NAME:
        fullName = entryText;
        break;
      case UserDetailEntryFieldLabel.PASSWORD:
        password = entryText;
        break;
      case UserDetailEntryFieldLabel.ORGANIZATION_NAME:
        organizationName = entryText;
        break;
    }
    notifyListeners();
  }

  bool isUserEntryDetailsEmpty() => [
        fullName,
        password,
        organizationName,
        organizationSize,
        jobTitle
      ].contains('');
}
