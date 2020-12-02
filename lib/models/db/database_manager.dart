import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// data models
import 'package:workplace_clone/data_models/app_user.dart';
import 'package:workplace_clone/data_models/group.dart';
import 'package:workplace_clone/data_models/organization.dart';
import 'package:workplace_clone/data_models/post.dart';

// database paths
const ORGANIZATION_PATH = 'organizations';
const USERS_PATH = 'users';
const GROUPS_PATH = 'groups';
const MEMBERS_PATH = 'members';
const POSTS_PATH = 'posts';
const FOLLOWINGS_PATH = 'followings';

// database fields
const ORGANIZATION_ID_FIELD = 'organizationId';
const USER_ID_FIELD = 'userId';
const GROUP_ID_FIELD = 'groupId';
const IS_INIT_FIELD = 'isInit';
const POST_ID_FIELD = 'postId';
const POST_DATE_TIME_FIELD = 'postDateTime';

class DatabaseManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // IS_EXISTED

  Future<bool> isUserExisted(User user) async {
    final QuerySnapshot query = await _db
        .collection(USERS_PATH)
        .where(USER_ID_FIELD, isEqualTo: user.uid)
        .get();
    return query.docs.isNotEmpty;
  }

  Future<bool> _isPostExisted(String organizationId) async {
    final query = await _db
        .collection(ORGANIZATION_PATH)
        .doc(organizationId)
        .collection(POSTS_PATH)
        .get();
    return query.docs.isNotEmpty;
  }

  Future<bool> isOrganizationExisted(String organizationId) async {
    final QuerySnapshot query = await _db
        .collection(ORGANIZATION_PATH)
        .where(ORGANIZATION_ID_FIELD, isEqualTo: organizationId)
        .get();
    return query.docs.isNotEmpty;
  }

  // INSERT

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

  Future<void> insertGroup(Group group, String organizationId) async =>
      await _db
          .collection(ORGANIZATION_PATH)
          .doc(organizationId)
          .collection(GROUPS_PATH)
          .doc(group.groupId)
          .set(group.toMap());

  Future<void> insertUserToGroup(
    String appUserId,
    String groupId,
    String organizationId,
  ) async {
    await _db
        .collection(ORGANIZATION_PATH)
        .doc(organizationId)
        .collection(GROUPS_PATH)
        .doc(groupId)
        .collection(MEMBERS_PATH)
        .doc(appUserId)
        .set({USER_ID_FIELD: appUserId});
    await _db
        .collection(USERS_PATH)
        .doc(appUserId)
        .collection(ORGANIZATION_PATH)
        .doc(organizationId)
        .collection(GROUPS_PATH)
        .doc(groupId)
        .set({GROUP_ID_FIELD: groupId});
  }

  Future<void> insertPost(Post post, String organizationId) async => await _db
      .collection(ORGANIZATION_PATH)
      .doc(organizationId)
      .collection(POSTS_PATH)
      .doc(post.postId)
      .set(post.toMap());

  // GET

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

  Future<String> getOrganizationIdByUserId(String userId) async {
    final QuerySnapshot query = await _db
        .collection(USERS_PATH)
        .doc(userId)
        .collection(ORGANIZATION_PATH)
        .get();
    return Organization.fromMap(query.docs.first.data()).organizationId;
  }

  Future<List<Group>> getGroupsByOrganizationId(String organizationId) async {
    final QuerySnapshot query = await _db
        .collection(ORGANIZATION_PATH)
        .doc(organizationId)
        .collection(GROUPS_PATH)
        .get();
    return query.docs.length == 0
        ? []
        : query.docs
            .map((DocumentSnapshot snapshot) => Group.fromMap(snapshot.data()))
            .toList();
  }

  Future<List<String>> getGroupMemberUserIds(
    String organizationId,
    String groupId,
  ) async {
    final QuerySnapshot query = await _db
        .collection(ORGANIZATION_PATH)
        .doc(organizationId)
        .collection(GROUPS_PATH)
        .doc(groupId)
        .collection(MEMBERS_PATH)
        .get();
    return query.docs.length == 0
        ? []
        : query.docs
            .map(
              (DocumentSnapshot snapshot) =>
                  AppUser.fromMap(snapshot.data()).userId,
            )
            .toList();
  }

  Future<List<String>> _getFollowingGroupIds(
    String organizationId,
    String appUserId,
  ) async {
    final QuerySnapshot query = await _db
        .collection(USERS_PATH)
        .doc(appUserId)
        .collection(ORGANIZATION_PATH)
        .doc(organizationId)
        .collection(GROUPS_PATH)
        .get();
    return query.docs.length == 0
        ? []
        : query.docs
            .map(
              (DocumentSnapshot snapshot) =>
                  Group.fromMap(snapshot.data()).groupId,
            )
            .toList();
  }

  Future<String> getGroupNameById(String organizationId, String groupId) async {
    final query = await _db
        .collection(ORGANIZATION_PATH)
        .doc(organizationId)
        .collection(GROUPS_PATH)
        .doc(groupId)
        .get();
    return Group.fromMap(query.data()).name;
  }

  Future<List<Group>> getFollowingGroups(
    String organizationId,
    String appUserId,
  ) async {
    final List<String> groupIds = await _getFollowingGroupIds(
      organizationId,
      appUserId,
    );
    return groupIds.length == 0
        ? []
        : await _db
            .collection(ORGANIZATION_PATH)
            .doc(organizationId)
            .collection(GROUPS_PATH)
            .where(GROUP_ID_FIELD, whereIn: groupIds)
            .get()
            .then(
              (QuerySnapshot querySnapshot) => querySnapshot.docs
                  .map(
                    (DocumentSnapshot snapshot) =>
                        Group.fromMap(snapshot.data()),
                  )
                  .toList(),
            );
  }

  Future<List<Post>> getFollowingGroupPosts(
    String organizationId,
    String appUserId,
  ) async {
    final List<String> groupIds =
        await _getFollowingGroupIds(organizationId, appUserId);
    return groupIds.length == 0
        ? []
        : await _isPostExisted(organizationId)
            ? await _db
                .collection(ORGANIZATION_PATH)
                .doc(organizationId)
                .collection(POSTS_PATH)
                .where(GROUP_ID_FIELD, whereIn: groupIds)
                .orderBy(POST_DATE_TIME_FIELD, descending: true)
                .get()
                .then(
                  (QuerySnapshot querySnapshot) => querySnapshot.docs
                      .map(
                        (DocumentSnapshot snapshot) =>
                            Post.fromMap(snapshot.data()),
                      )
                      .toList(),
                )
            : [];
  }

  Future<List<String>> _getFollowingUserIds(
    String organizationId,
    String appUserId,
  ) async {
    final QuerySnapshot query = await _db
        .collection(USERS_PATH)
        .doc(appUserId)
        .collection(ORGANIZATION_PATH)
        .doc(organizationId)
        .collection(FOLLOWINGS_PATH)
        .get();
    return query.docs.length == 0
        ? []
        : query.docs
            .map(
              (DocumentSnapshot snapshot) => AppUser.fromMap(snapshot.data()),
            )
            .toList();
  }

  Future<List<Post>> getMyselfAndFollowingUsersPosts(
    String organizationId,
    String myUserId,
  ) async {
    final List<String> userIds =
        (await _getFollowingUserIds(organizationId, myUserId))
            .followedBy([myUserId]).toList();
    return await _isPostExisted(organizationId)
        ? await _db
            .collection(ORGANIZATION_PATH)
            .doc(organizationId)
            .collection(POSTS_PATH)
            .where(GROUP_ID_FIELD, isEqualTo: '')
            .where(USER_ID_FIELD, whereIn: userIds)
            .orderBy(POST_DATE_TIME_FIELD, descending: true)
            .get()
            .then(
              (QuerySnapshot querySnapshot) => querySnapshot.docs
                  .map(
                    (DocumentSnapshot snapshot) =>
                        Post.fromMap(snapshot.data()),
                  )
                  .toList(),
            )
        : [];
  }

  Future<List<Post>> getProfileUserPosts(
    String organizationId,
    String profileUserId,
  ) async =>
      await _isPostExisted(organizationId)
          ? await _db
              .collection(ORGANIZATION_PATH)
              .doc(organizationId)
              .collection(POSTS_PATH)
              .where(USER_ID_FIELD, isEqualTo: profileUserId)
              .orderBy(POST_DATE_TIME_FIELD, descending: true)
              .get()
              .then(
                (QuerySnapshot querySnapshot) => querySnapshot.docs
                    .map(
                      (DocumentSnapshot snapshot) =>
                          Post.fromMap(snapshot.data()),
                    )
                    .toList(),
              )
          : [];

  Future<List<String>> getInitialGroupIds(String organizationId) async =>
      await _db
          .collection(ORGANIZATION_PATH)
          .doc(organizationId)
          .collection(GROUPS_PATH)
          .where(IS_INIT_FIELD, isEqualTo: true)
          .get()
          .then(
            (QuerySnapshot querySnapshot) => querySnapshot.docs
                .map(
                  (DocumentSnapshot snapshot) =>
                      Group.fromMap(snapshot.data()).groupId,
                )
                .toList(),
          );

  // UPDATE

  Future<void> initializeCompleted(Organization organization) async {
    final DocumentReference reference =
        _db.collection(ORGANIZATION_PATH).doc(organization.organizationId);
    await reference.update(organization.copyWith(isInit: false).toMap());
  }
}
