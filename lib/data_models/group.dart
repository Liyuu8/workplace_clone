import 'package:flutter/material.dart';

class Group {
  final String groupId;
  final String name;
  final String type;
  final String visibility;
  final String description;
  final String photoUrl;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Group({
    @required this.groupId,
    @required this.name,
    @required this.type,
    @required this.visibility,
    @required this.description,
    @required this.photoUrl,
  });

  Group copyWith({
    String groupId,
    String name,
    String type,
    String visibility,
    String description,
    String photoUrl,
  }) {
    if ((groupId == null || identical(groupId, this.groupId)) &&
        (name == null || identical(name, this.name)) &&
        (type == null || identical(type, this.type)) &&
        (visibility == null || identical(visibility, this.visibility)) &&
        (description == null || identical(description, this.description)) &&
        (photoUrl == null || identical(photoUrl, this.photoUrl))) {
      return this;
    }

    return new Group(
      groupId: groupId ?? this.groupId,
      name: name ?? this.name,
      type: type ?? this.type,
      visibility: visibility ?? this.visibility,
      description: description ?? this.description,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  @override
  String toString() {
    return 'Group{groupId: $groupId, name: $name, type: $type, visibility: $visibility, description: $description, photoUrl: $photoUrl}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Group &&
          runtimeType == other.runtimeType &&
          groupId == other.groupId &&
          name == other.name &&
          type == other.type &&
          visibility == other.visibility &&
          description == other.description &&
          photoUrl == other.photoUrl);

  @override
  int get hashCode =>
      groupId.hashCode ^
      name.hashCode ^
      type.hashCode ^
      visibility.hashCode ^
      description.hashCode ^
      photoUrl.hashCode;

  factory Group.fromMap(Map<String, dynamic> map) {
    return new Group(
      groupId: map['groupId'] as String,
      name: map['name'] as String,
      type: map['type'] as String,
      visibility: map['visibility'] as String,
      description: map['description'] as String,
      photoUrl: map['photoUrl'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'groupId': this.groupId,
      'name': this.name,
      'type': this.type,
      'visibility': this.visibility,
      'description': this.description,
      'photoUrl': this.photoUrl,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
