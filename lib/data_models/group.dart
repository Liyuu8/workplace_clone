import 'package:flutter/material.dart';

class Group {
  final String groupId;
  final String name;
  final String type;
  final String privacy;
  final String description;
  final String photoUrl;
  final bool isInit;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Group({
    @required this.groupId,
    @required this.name,
    @required this.type,
    @required this.privacy,
    @required this.description,
    @required this.photoUrl,
    @required this.isInit,
  });

  Group copyWith({
    String groupId,
    String name,
    String type,
    String privacy,
    String description,
    String photoUrl,
    bool isInit,
  }) {
    if ((groupId == null || identical(groupId, this.groupId)) &&
        (name == null || identical(name, this.name)) &&
        (type == null || identical(type, this.type)) &&
        (privacy == null || identical(privacy, this.privacy)) &&
        (description == null || identical(description, this.description)) &&
        (photoUrl == null || identical(photoUrl, this.photoUrl)) &&
        (isInit == null || identical(isInit, this.isInit))) {
      return this;
    }

    return new Group(
      groupId: groupId ?? this.groupId,
      name: name ?? this.name,
      type: type ?? this.type,
      privacy: privacy ?? this.privacy,
      description: description ?? this.description,
      photoUrl: photoUrl ?? this.photoUrl,
      isInit: isInit ?? this.isInit,
    );
  }

  @override
  String toString() {
    return 'Group{groupId: $groupId, name: $name, type: $type, privacy: $privacy, description: $description, photoUrl: $photoUrl, isInit: $isInit}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Group &&
          runtimeType == other.runtimeType &&
          groupId == other.groupId &&
          name == other.name &&
          type == other.type &&
          privacy == other.privacy &&
          description == other.description &&
          photoUrl == other.photoUrl &&
          isInit == other.isInit);

  @override
  int get hashCode =>
      groupId.hashCode ^
      name.hashCode ^
      type.hashCode ^
      privacy.hashCode ^
      description.hashCode ^
      photoUrl.hashCode ^
      isInit.hashCode;

  factory Group.fromMap(Map<String, dynamic> map) {
    return new Group(
      groupId: map['groupId'] as String,
      name: map['name'] as String,
      type: map['type'] as String,
      privacy: map['privacy'] as String,
      description: map['description'] as String,
      photoUrl: map['photoUrl'] as String,
      isInit: map['isInit'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'groupId': this.groupId,
      'name': this.name,
      'type': this.type,
      'privacy': this.privacy,
      'description': this.description,
      'photoUrl': this.photoUrl,
      'isInit': this.isInit,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}

class GroupInfo {
  final String groupId;
  final List<String> memberUserIds;
  GroupInfo({this.groupId, this.memberUserIds});
}
