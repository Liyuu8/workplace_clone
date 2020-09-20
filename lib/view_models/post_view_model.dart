import 'package:flutter/material.dart';

// data models
import 'package:workplace_clone/data_models/app_user.dart';
import 'package:workplace_clone/data_models/organization.dart';

// repositories
import 'package:workplace_clone/models/repositories/post_repository.dart';
import 'package:workplace_clone/models/repositories/user_repository.dart';

class PostViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final PostRepository postRepository;
  PostViewModel({this.userRepository, this.postRepository});

  Organization _usersOrganization;
  Organization get usersOrganization => _usersOrganization;

  AppUser _currentUser;
  AppUser get currentUser => _currentUser;

  Status _status = Status.Uninitialized;
  Status get status => _status;

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
    print('PostViewModel.onUserRepositoryUpdated: status is $_status');
    notifyListeners();
  }

  String _postContent = '';
  String get postContent => _postContent;

  bool isPostEmpty() => _postContent == '';

  updatePostField(String updatedPost) {
    _postContent = updatedPost;
    notifyListeners();
  }

  Future<void> executePost(String groupId) async {
    _startProcessing();
    await postRepository.executePost(
      organizationId: _usersOrganization.organizationId,
      currentUserId: _currentUser.userId,
      groupId: groupId,
      content: _postContent,
    );
    _finishProcessing();
  }
}
