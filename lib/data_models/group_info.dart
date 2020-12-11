import 'package:flutter/material.dart';

class GroupInfo {
  String groupId;
  List<String> memberUserIds;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  GroupInfo({
    @required this.groupId,
    @required this.memberUserIds,
  });

  GroupInfo copyWith({
    String groupId,
    List<String> memberUserIds,
  }) {
    return new GroupInfo(
      groupId: groupId ?? this.groupId,
      memberUserIds: memberUserIds ?? this.memberUserIds,
    );
  }

  @override
  String toString() {
    return 'GroupInfo{groupId: $groupId, memberUserIds: $memberUserIds}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupInfo &&
          runtimeType == other.runtimeType &&
          groupId == other.groupId &&
          memberUserIds == other.memberUserIds);

  @override
  int get hashCode => groupId.hashCode ^ memberUserIds.hashCode;

  factory GroupInfo.fromMap(Map<String, dynamic> map) {
    return new GroupInfo(
      groupId: map['groupId'] as String,
      memberUserIds: map['memberUserIds'] as List<String>,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'groupId': this.groupId,
      'memberUserIds': this.memberUserIds,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
