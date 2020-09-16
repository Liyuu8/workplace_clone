// data models
import 'package:workplace_clone/data_models/app_user.dart';
import 'package:workplace_clone/data_models/post.dart';

// db
import 'package:workplace_clone/models/db/database_manager.dart';

class PostRepository {
  final DatabaseManager dbManager;
  PostRepository({this.dbManager});

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
