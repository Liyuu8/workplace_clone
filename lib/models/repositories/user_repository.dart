import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

// data models
import 'package:workplace_clone/data_models/app_user.dart';
import 'package:workplace_clone/data_models/organization.dart';

// db
import 'package:workplace_clone/models/db/database_manager.dart';

class UserRepository {
  final DatabaseManager dbManager;
  UserRepository({this.dbManager});

  static Organization usersOrganization;
  static AppUser currentUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> isSignIn() async {
    if (_auth.currentUser != null) {
      currentUser = await dbManager.getUserById(_auth.currentUser.uid);
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
      final userCredential = await _auth.createUserWithEmailAndPassword(
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

      // アプリ全体で使用可能とするためにstatic変数に格納する
      usersOrganization =
          await dbManager.getOrganizationById(newOrganization.organizationId);
      currentUser = await dbManager.getUserById(newUser.uid);

      return true;
    } catch (e) {
      print('sign up error caught: ${e.toString()}');
      return false;
    }
  }

  Future<bool> signUpIntoExistingOrganization(
    String email,
    String password,
    String organizationId,
  ) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User user = userCredential.user;

      if (user == null) {
        return false;
      }

      await dbManager.insertUser(
        AppUser(
          userId: user.uid,
          fullName: user.displayName,
          photoUrl: user.photoURL,
          email: user.email,
          bio: '',
        ),
        organizationId,
      );

      // アプリ全体で使用可能とするためにstatic変数に格納する
      usersOrganization = await dbManager.getOrganizationById(organizationId);
      currentUser = await dbManager.getUserById(user.uid);
      return true;
    } catch (e) {
      print('sign up error caught: ${e.toString()}');
      return false;
    }
  }

  Future<bool> logIn(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;

      if (user == null) {
        return false;
      }

      // アプリ全体で使用可能にするためにstatic変数に格納する
      usersOrganization = await dbManager.getOrganizationByUserId(user.uid);
      currentUser = await dbManager.getUserById(user.uid);
      return true;
    } catch (e) {
      print('sign in error caught: ${e.toString()}');
      return false;
    }
  }
}
