import 'package:uuid/uuid.dart';

// data models
import 'package:workplace_clone/data_models/app_user.dart';
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
      (post1, post2) => post1.postDateTime.compareTo(post2.postDateTime),
    );
    return resultList;
  }
}