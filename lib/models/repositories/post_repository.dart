import 'package:uuid/uuid.dart';

// data models
import 'package:workplace_clone/data_models/app_user.dart';
import 'package:workplace_clone/data_models/like.dart';
import 'package:workplace_clone/data_models/post.dart';

// db
import 'package:workplace_clone/models/db/database_manager.dart';

class PostRepository {
  final DatabaseManager dbManager;
  PostRepository({this.dbManager});

  Future<void> executePost({
    String organizationId,
    String currentUserId,
    String groupId,
    String content,
  }) async =>
      await dbManager.insertPost(
        Post(
          postId: Uuid().v1(),
          userId: currentUserId,
          groupId: groupId,
          imageUrl: null,
          imageStoragePath: null,
          content: content,
          postDateTime: DateTime.now(),
        ),
        organizationId,
      );

  Future<List<Post>> getMyselfAndFollowingUsersAndGroupPosts(
      String organizationId, AppUser currentUser) async {
    List<Post> resultList = [
      ...(await dbManager.getMyselfAndFollowingUsersPosts(
          organizationId, currentUser.userId)),
      ...(await dbManager.getFollowingGroupPosts(
          organizationId, currentUser.userId)),
    ];
    resultList.sort(
      (post1, post2) => post2.postDateTime.compareTo(post1.postDateTime),
    );
    return resultList;
  }

  Future<String> getGroupNameById(
          String organizationId, String groupId) async =>
      await dbManager.getGroupNameById(organizationId, groupId);

  Future<List<Post>> getProfileUserPosts(
          String organizationId, AppUser profileUser) async =>
      await dbManager.getProfileUserPosts(organizationId, profileUser.userId);

  Future<void> likeIt(
    String organizationId,
    Post post,
    AppUser currentUser,
  ) async =>
      await dbManager.likeIt(
        organizationId,
        Like(
          likeId: Uuid().v1(),
          likedPostId: post.postId,
          likeUserId: currentUser.userId,
          likeDateTime: DateTime.now(),
        ),
      );

  Future<void> unLikeIt(
    String organizationId,
    Post post,
    AppUser currentUser,
  ) async =>
      await dbManager.unLikeIt(organizationId, post, currentUser);

  Future<PostLikeInfo> getPostLikeInfo(
    String organizationId,
    String likedPostId,
    AppUser currentUser,
  ) async {
    // 「いいね」の取得
    final likes = await dbManager.getPostLikes(organizationId, likedPostId);

    // 自分が「いいね」したものを取得
    return PostLikeInfo(
      isLikedToThisPost: likes.any(
        (like) => like.likeUserId == currentUser.userId,
      ),
      likeUserNameList: await Future.wait(
        likes.map(
          (like) async =>
              (await dbManager.getUserById(like.likeUserId)).fullName,
        ),
      ),
    );
  }
}
