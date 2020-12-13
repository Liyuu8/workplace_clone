import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

// data models
import 'package:workplace_clone/data_models/app_user.dart';
import 'package:workplace_clone/data_models/organization.dart';

// db
import 'package:workplace_clone/models/db/database_manager.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserRepository extends ChangeNotifier {
  final FirebaseAuth auth;
  final DatabaseManager dbManager;
  UserRepository({this.auth, this.dbManager}) {
    auth.authStateChanges().listen(onAuthStateChanged);
  }

  Organization _usersOrganization;
  Organization get usersOrganization => _usersOrganization;

  AppUser _currentUser;
  AppUser get currentUser => _currentUser;

  Status _status = Status.Uninitialized;
  Status get status => _status;

  _startProgressing() {
    _status = Status.Authenticating;
    notifyListeners();
  }

  _finishProgressingWithSuccess() {
    _status = Status.Authenticated;
    notifyListeners();
  }

  _finishProgressingWithFailure() {
    _status = Status.Unauthenticated;
    notifyListeners();
  }

  Future<void> onAuthStateChanged(User user) async {
    if (user == null) {
      _usersOrganization = null;
      _currentUser = null;
      _status = Status.Unauthenticated;
      notifyListeners();
      return;
    }

    if (await dbManager.isUserExisted(user)) {
      _currentUser ??= await dbManager.getUserById(user.uid);
      _usersOrganization ??= await dbManager.getOrganizationById(
        await dbManager.getOrganizationIdByUserId(user.uid),
      );
      _status = Status.Authenticated;
      notifyListeners();
    }
  }

  Future<bool> isSignIn() async {
    if (auth.currentUser != null) {
      final userId = auth.currentUser.uid;
      _currentUser = await dbManager.getUserById(userId);
      _usersOrganization = await dbManager.getOrganizationById(
        await dbManager.getOrganizationIdByUserId(userId),
      );
      return true;
    }
    return false;
  }

  Future<bool> signUpAndCreateOrganization(
    String email,
    String fullName,
    String password,
    String organizationName,
    String organizationSize,
    String jobTitle,
  ) async {
    try {
      _startProgressing();

      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User newUser = userCredential.user;

      if (newUser == null) {
        return false;
      }

      final newOrganization = Organization(
        organizationId: Uuid().v1(),
        name: organizationName,
        size: organizationSize,
        jobTitle: jobTitle,
        isInit: true,
      );
      await dbManager.insertOrganization(newOrganization);

      await dbManager.insertUser(
        AppUser(
          userId: newUser.uid,
          fullName: fullName,
          photoUrl: newUser.photoURL,
          email: newUser.email,
          bio: '',
        ),
        newOrganization.organizationId,
      );

      _usersOrganization =
          await dbManager.getOrganizationById(newOrganization.organizationId);
      _currentUser = await dbManager.getUserById(newUser.uid);

      _finishProgressingWithSuccess();
      return true;
    } catch (e) {
      print('sign up error caught: ${e.toString()}');

      _finishProgressingWithFailure();
      return false;
    }
  }

  Future<String> signUpIntoExistingOrganization(
    String email,
    String fullName,
    String password,
    String organizationId,
  ) async {
    try {
      _startProgressing();

      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User newUser = userCredential.user;

      if (newUser == null) {
        return null;
      }

      await dbManager.insertUser(
        AppUser(
          userId: newUser.uid,
          fullName: fullName,
          photoUrl: newUser.photoURL,
          email: newUser.email,
          bio: '',
        ),
        organizationId,
      );

      _usersOrganization = await dbManager.getOrganizationById(organizationId);
      _currentUser = await dbManager.getUserById(newUser.uid);

      _finishProgressingWithSuccess();
      return newUser.uid;
    } catch (e) {
      print('sign up error caught: ${e.toString()}');

      _finishProgressingWithFailure();
      return null;
    }
  }

  Future<bool> logIn(String email, String password) async {
    try {
      _startProgressing();

      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;

      if (user == null) {
        return false;
      }

      _currentUser = await dbManager.getUserById(user.uid);
      _usersOrganization = await dbManager.getOrganizationById(
        await dbManager.getOrganizationIdByUserId(user.uid),
      );

      _finishProgressingWithSuccess();
      return true;
    } catch (e) {
      print('sign in error caught: ${e.toString()}');

      _finishProgressingWithFailure();
      return false;
    }
  }

  Future<void> signOut() async {
    auth.signOut();
    _currentUser = null;
  }

  Future<AppUser> getPostUser(String userId) async =>
      await dbManager.getUserById(userId);

  Future<bool> isOrganizationExisted(String organizationId) async =>
      dbManager.isOrganizationExisted(organizationId);

  Future<void> initializeCompleted() async =>
      await dbManager.initializeCompleted(_usersOrganization);

  Future<void> follow(AppUser profileUser) async =>
      await dbManager.follow(profileUser, currentUser);

  Future<void> unFollow(AppUser profileUser) async =>
      await dbManager.unFollow(profileUser, currentUser);

  Future<bool> checkIsFollowing(AppUser profileUser) async =>
      await dbManager.checkIsFollowing(profileUser, currentUser);
}
