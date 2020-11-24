import 'package:flutter/material.dart';

// data models
import 'package:workplace_clone/data_models/app_user.dart';
import 'package:workplace_clone/data_models/group.dart';
import 'package:workplace_clone/data_models/organization.dart';
import 'package:workplace_clone/data_models/post.dart';

// repositories
import 'package:workplace_clone/models/repositories/group_repository.dart';
import 'package:workplace_clone/models/repositories/post_repository.dart';
import 'package:workplace_clone/models/repositories/user_repository.dart';

// utils
import 'package:workplace_clone/utils/constants.dart';

class ProfileViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final GroupRepository groupRepository;
  final PostRepository postRepository;
  ProfileViewModel({
    this.userRepository,
    this.groupRepository,
    this.postRepository,
  });

  AppUser _profileUser;
  AppUser get profileUser => _profileUser;

  Organization _usersOrganization;
  Organization get usersOrganization => _usersOrganization;

  AppUser _currentUser;
  AppUser get currentUser => _currentUser;

  Status _status = Status.Uninitialized;
  Status get status => _status;

  List<Group> _groups = [];
  List<Group> get groups => _groups;

  Map<String, List<String>> _groupMemberUserIds = {};
  Map<String, List<String>> get groupMemberUserIds => _groupMemberUserIds;

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
    print('ProfileViewModel.onUserRepositoryUpdated: status is $_status');
    notifyListeners();
  }

  setProfileUser(ProfileMode profileMode, AppUser selectedUser) {
    _profileUser =
        profileMode == ProfileMode.MYSELF ? currentUser : selectedUser;
  }

  Future<void> getProfileUserPosts() async {
    _startProcessing();
    _posts = await postRepository.getProfileUserPosts(
        _usersOrganization.organizationId, _profileUser);
    _finishProcessing();
  }

  Future<void> getProfileUsersGroups() async {
    _startProcessing();
    _groups = await groupRepository.getFollowingGroups(
      _usersOrganization.organizationId,
      _profileUser.userId,
    );
    _finishProcessing();
  }
}
