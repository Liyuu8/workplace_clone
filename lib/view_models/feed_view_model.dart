import 'package:flutter/material.dart';

// data models
import 'package:workplace_clone/data_models/app_user.dart';
import 'package:workplace_clone/data_models/group.dart';
import 'package:workplace_clone/data_models/group_info.dart';
import 'package:workplace_clone/data_models/organization.dart';
import 'package:workplace_clone/data_models/post.dart';
import 'package:workplace_clone/data_models/post_info.dart';

// repositories
import 'package:workplace_clone/models/repositories/group_repository.dart';
import 'package:workplace_clone/models/repositories/post_repository.dart';
import 'package:workplace_clone/models/repositories/user_repository.dart';

class FeedViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final GroupRepository groupRepository;
  final PostRepository postRepository;
  FeedViewModel({
    this.userRepository,
    this.groupRepository,
    this.postRepository,
  });

  Organization _usersOrganization;
  Organization get usersOrganization => _usersOrganization;

  AppUser _currentUser;
  AppUser get currentUser => _currentUser;

  Status _status = Status.Uninitialized;
  Status get status => _status;

  List<Group> _groups = [];
  List<Group> get groups => _groups;

  List<Post> _posts = [];
  List<Post> get posts => _posts;

  bool _isProcessing = false;
  bool get isProcessing => _isProcessing;

  _startProcessing() {
    _isProcessing = true;
    notifyListeners();
  }

  _finishProcessing() {
    _isProcessing = false;
    notifyListeners();
  }

  onUserRepositoryUpdated(UserRepository userRepository) {
    _usersOrganization = userRepository.usersOrganization;
    _currentUser = userRepository.currentUser;
    _status = userRepository.status;
    print('FeedViewModel.onUserRepositoryUpdated: status is $_status');
    notifyListeners();
  }

  Future<void> getMyselfAndFollowingUsersAndGroupPosts() async {
    _startProcessing();
    _posts = await postRepository.getMyselfAndFollowingUsersAndGroupPosts(
      _usersOrganization.organizationId,
      _currentUser,
    );
    _finishProcessing();
  }

  Future<void> getGroups() async {
    _startProcessing();
    _groups = await groupRepository
        .getGroupsByOrganizationId(_usersOrganization.organizationId);
    _finishProcessing();
  }

  Future<List<GroupInfo>> getGroupInfo() async => await Future.forEach(
        _groups,
        (Group group) async => GroupInfo(
          groupId: group.groupId,
          memberUserIds: await groupRepository.getGroupMemberUserIds(
            _usersOrganization.organizationId,
            group.groupId,
          ),
        ),
      );

  Future<PostInfo> getPostInfo(Post post) async => PostInfo(
        postUser: await userRepository.getPostUser(post.userId),
        postedGroupName: post.groupId != ''
            ? await postRepository.getGroupNameById(
                usersOrganization.organizationId,
                post.groupId,
              )
            : '',
      );
}
