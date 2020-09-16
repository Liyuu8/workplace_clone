import 'package:uuid/uuid.dart';

// data models
import 'package:workplace_clone/data_models/group.dart';

// db
import 'package:workplace_clone/models/db/database_manager.dart';

const List<String> groupTypeList = [
  'Teams & Projects',
  'Discussions',
  'Announcements',
  'Social & More',
];
const List<String> groupPrivacyList = [
  'Open',
  'Closed',
  'Secret',
];

class GroupRepository {
  final DatabaseManager dbManager;
  GroupRepository({this.dbManager});

  Future<void> initializeGroup(
    List<bool> initialGroupCheckList,
    String organizationId,
    String initialUserId,
  ) async {
    final List<String> initialGroupNameList = [
      'Company Announcements',
      'Marketing team',
      'Company Social',
      'Project Updates',
      'General',
    ];
    final List<String> initialGroupDescriptionList = [
      'Use this group to share news, livestream talks and events or create polls',
      'Use this group to have marketing team discussions, make team updates and share marketing presentations',
      'Use this group to plan events, share links and videos or buy and sell with coworkers',
      'Use this group to share your latest project work and get feedback on it',
      'This is your first group. it\'s a great place to share things like important announcements. Everyone who joins your community will be added to this group automatically. So you don\'t need to invite them.',
    ];
    final List<String> initialGroupTypeList = [
      groupTypeList[2],
      groupTypeList[1],
      groupTypeList[3],
      groupTypeList[2],
      groupTypeList[0],
    ];
    final List<String> initialGroupPhotoUrlList = [
      'assets/images/group_company_announcements.jpg',
      'assets/images/group_marketing_team.jpg',
      'assets/images/group_company_social.jpg',
      'assets/images/group_project_updates.jpg',
      'assets/images/group_general.jpg',
    ];
    List<int> initialGroupNumberList = [];
    initialGroupCheckList.add(true); // General を追加
    initialGroupCheckList.asMap().forEach((index, isChecked) =>
        isChecked ? initialGroupNumberList.add(index) : null);
    await Future.forEach(initialGroupNumberList, (checkedIndex) async {
      final newGroup = Group(
        groupId: Uuid().v1(),
        name: initialGroupNameList[checkedIndex],
        type: initialGroupTypeList[checkedIndex],
        privacy: groupPrivacyList.first,
        description: initialGroupDescriptionList[checkedIndex],
        photoUrl: initialGroupPhotoUrlList[checkedIndex],
      );
      dbManager.insertGroup(newGroup, organizationId);
      dbManager.insertUserToGroup(
        initialUserId,
        newGroup.groupId,
        organizationId,
      );
      print('GroupRepository.initializeGroup: newGroup is $newGroup');
    });
  }

  Future<List<Group>> getGroupsByOrganizationId(String organizationId) async =>
      await dbManager.getGroupsByOrganizationId(organizationId);

  Future<List<String>> getGroupMemberUserIds(
          String organizationId, String groupId) async =>
      await dbManager.getGroupMemberUserIds(organizationId, groupId);
}
