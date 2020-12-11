import 'package:flutter/material.dart';

// data models
import 'package:workplace_clone/data_models/app_user.dart';

class PostInfo {
  AppUser postUser;
  String postedGroupName;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  PostInfo({
    @required this.postUser,
    @required this.postedGroupName,
  });

  PostInfo copyWith({
    AppUser postUser,
    String postedGroupName,
  }) {
    return new PostInfo(
      postUser: postUser ?? this.postUser,
      postedGroupName: postedGroupName ?? this.postedGroupName,
    );
  }

  @override
  String toString() {
    return 'PostInfo{postUser: $postUser, postedGroupName: $postedGroupName}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostInfo &&
          runtimeType == other.runtimeType &&
          postUser == other.postUser &&
          postedGroupName == other.postedGroupName);

  @override
  int get hashCode => postUser.hashCode ^ postedGroupName.hashCode;

  factory PostInfo.fromMap(Map<String, dynamic> map) {
    return new PostInfo(
      postUser: map['postUser'] as AppUser,
      postedGroupName: map['postedGroupName'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'postUser': this.postUser,
      'postedGroupName': this.postedGroupName,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
