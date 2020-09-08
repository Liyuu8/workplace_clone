import 'package:flutter/material.dart';

// data models
import 'package:workplace_clone/data_models/app_user.dart';
import 'package:workplace_clone/data_models/organization.dart';

// models
import 'package:workplace_clone/models/repositories/group_repository.dart';
import 'package:workplace_clone/models/repositories/user_repository.dart';

// utils
import 'package:workplace_clone/utils/constants.dart';

class WelcomeViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final GroupRepository groupRepository;
  WelcomeViewModel({this.userRepository, this.groupRepository});

  String _organizationId = '';
  String get organizationId => _organizationId;

  Organization _usersOrganization;
  Organization get usersOrganization => _usersOrganization;

  AppUser _currentUser;
  AppUser get currentUser => _currentUser;

  Status _status = Status.Uninitialized;
  Status get status => _status;

  onUserRepositoryUpdated(UserRepository userRepository) {
    _usersOrganization = userRepository.usersOrganization;
    _currentUser = userRepository.currentUser;
    _status = userRepository.status;
    print('onUserRepositoryUpdated: status is $_status');
    notifyListeners();
  }

  String _email = '';
  String get email => _email;

  String _fullName = '';
  String get fullName => _fullName;

  String _password = '';
  String get password => _password;

  String _organizationName = '';
  String get organizationName => _organizationName;

  String _organizationSize = '';
  String get organizationSize => _organizationSize;

  String _jobTitle = '';
  String get jobTitle => _jobTitle;

  List<bool> _initialGroupCheckList = [true, true, true, true];
  List<bool> get initialGroupCheckList => _initialGroupCheckList;

  bool _isInitialGroupSkipped = false;

  String _someoneEmail1 = '';
  String get someoneEmail1 => _someoneEmail1;

  String _someoneEmail2 = '';
  String get someoneEmail2 => _someoneEmail2;

  Future<bool> isSignIn() async => await userRepository.isSignIn();

  Future<void> signUpAndCreateOrganization() async =>
      await userRepository.signUpAndCreateOrganization(
        _email,
        _fullName,
        _password,
        _organizationName,
        _organizationSize,
        _jobTitle,
      );

  Future<void> signUpIntoExistingOrganization() async =>
      await userRepository.signUpIntoExistingOrganization(
        _email,
        _fullName,
        _password,
        _organizationId,
      );

  Future<void> logIn() async => await userRepository.logIn(_email, _password);

  updateEmailField(String updatedEmail) {
    _email = updatedEmail;
    notifyListeners();
  }

  bool isEmailEmpty() => _email == '';

  updateTextFieldByBottomSheet(
    String content,
    BottomSheetContentType contentType,
  ) {
    contentType == BottomSheetContentType.ORGANIZATION_SIZE
        ? _organizationSize = content
        : _jobTitle = content;
    notifyListeners();
  }

  updateUserEntryDetails(
    String entryText,
    UserDetailEntryFieldLabel fieldLabel,
  ) {
    switch (fieldLabel) {
      case UserDetailEntryFieldLabel.FULL_NAME:
        _fullName = entryText;
        break;
      case UserDetailEntryFieldLabel.PASSWORD:
        _password = entryText;
        break;
      case UserDetailEntryFieldLabel.ORGANIZATION_NAME:
        _organizationName = entryText;
        break;
    }
    notifyListeners();
  }

  bool isUserEntryDetailsEmpty() => [
        _fullName,
        _password,
        _organizationName,
        _organizationSize,
        _jobTitle
      ].contains('');

  updatePasswordField(String updatedPassword) {
    _password = updatedPassword;
    notifyListeners();
  }

  bool isPasswordEmpty() => _password == '';

  updateInitialGroupCheckList(int index, bool isChecked) {
    _initialGroupCheckList[index] = isChecked;
    notifyListeners();
  }

  skipInitialGroupCreated() => _isInitialGroupSkipped = true;

  updateSomeoneEmailField(String updatedEmail, int index) {
    index == 1 ? _someoneEmail1 = updatedEmail : _someoneEmail2 = updatedEmail;
    notifyListeners();
  }

  bool isSomeoneEmailEmpty() =>
      [_someoneEmail1, _someoneEmail2].every((email) => email == '');

  backCreateGroups() => _isInitialGroupSkipped = false;

  Future<void> initializeOrganizationSetting() async {
    if (!_isInitialGroupSkipped) {
      await groupRepository.initializeGroup(
        _initialGroupCheckList,
        _usersOrganization.organizationId,
        _currentUser.userId,
      );
    }
    // TODO: firebase_dynamic_links を利用して、ユーザーへの招待リンクを生成・送信したい
  }

  Future<void> signOut() async => userRepository.signOut();
}
