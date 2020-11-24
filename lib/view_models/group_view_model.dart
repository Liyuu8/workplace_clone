import 'package:flutter/material.dart';

// data models
import 'package:workplace_clone/data_models/app_user.dart';
import 'package:workplace_clone/data_models/group.dart';
import 'package:workplace_clone/data_models/organization.dart';

// repositories
import 'package:workplace_clone/models/repositories/group_repository.dart';
import 'package:workplace_clone/models/repositories/user_repository.dart';

// utils
import 'package:workplace_clone/utils/constants.dart';

const List<GroupSortAndFilter> groupSortAndFilterIndexList = [
  GroupSortAndFilter.RecentlyVisited,
  GroupSortAndFilter.Name,
  GroupSortAndFilter.Favorites,
  GroupSortAndFilter.Top,
  GroupSortAndFilter.LatestActivity,
];
const Map<GroupSortAndFilter, String> groupSortAndFilterStringMap = {
  GroupSortAndFilter.RecentlyVisited: 'Recently Visited',
  GroupSortAndFilter.Name: 'Name',
  GroupSortAndFilter.Favorites: 'Favorites',
  GroupSortAndFilter.Top: 'Top',
  GroupSortAndFilter.LatestActivity: 'Latest Activity',
};

class GroupViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final GroupRepository groupRepository;
  GroupViewModel({this.userRepository, this.groupRepository});

  Organization _usersOrganization;
  Organization get usersOrganization => _usersOrganization;

  AppUser _currentUser;
  AppUser get currentUser => _currentUser;

  Status _status = Status.Uninitialized;
  Status get status => _status;

  List<Group> _groups = [];
  List<Group> get groups => _groups;

  int _groupSortAndFilterIndex = 0;
  int get groupSortAndFilterIndex => _groupSortAndFilterIndex;

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
    print('GroupViewModel.onUserRepositoryUpdated: status is $_status');
    notifyListeners();
  }

  Future<void> getGroups() async {
    _startProcessing();
    _groups = await groupRepository
        .getGroupsByOrganizationId(_usersOrganization.organizationId);
    _finishProcessing();
  }

  // TODO: グループリストのソート機能
  updateGroupSortAndFilterSetting(int selectedIndex) {
    if (selectedIndex != null) {
      _groupSortAndFilterIndex = selectedIndex;
      notifyListeners();
    }
  }
}
