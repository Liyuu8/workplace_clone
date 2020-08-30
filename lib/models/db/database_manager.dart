import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// data models
import 'package:workplace_clone/data_models/app_user.dart';
import 'package:workplace_clone/data_models/organization.dart';

// database paths
const ORGANIZATION_PATH = 'organizations';
const USERS_PATH = 'users';

// database fields
const ORGANIZATION_ID_FIELD = 'organizationId';
const USER_ID_FIELD = 'userId';

class DatabaseManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> isUserExisted(User user) async {
    final QuerySnapshot query = await _db
        .collection(USERS_PATH)
        .where(USER_ID_FIELD, isEqualTo: user.uid)
        .get();
    return query.docs.isNotEmpty;
  }

  Future<void> insertOrganization(Organization organization) async {
    await _db
        .collection(ORGANIZATION_PATH)
        .doc(organization.organizationId)
        .set(organization.toMap());
  }

  Future<void> insertUser(AppUser appUser, String organizationId) async {
    // toMapを用いてユーザー情報をDBで登録する形へ自動変換
    await _db.collection(USERS_PATH).doc(appUser.userId).set(appUser.toMap());
    await _db
        .collection(USERS_PATH)
        .doc(appUser.userId)
        .collection(ORGANIZATION_PATH)
        .doc(organizationId)
        .set({ORGANIZATION_ID_FIELD: organizationId});
  }

  Future<Organization> getOrganizationById(String organizationId) async {
    final QuerySnapshot query = await _db
        .collection(ORGANIZATION_PATH)
        .where(ORGANIZATION_ID_FIELD, isEqualTo: organizationId)
        .get();
    return Organization.fromMap(query.docs.first.data());
  }

  Future<AppUser> getUserById(String userId) async {
    final QuerySnapshot query = await _db
        .collection(USERS_PATH)
        .where(USER_ID_FIELD, isEqualTo: userId)
        .get();
    return AppUser.fromMap(query.docs.first.data());
  }
}
