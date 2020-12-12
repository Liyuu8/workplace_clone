import 'package:flutter/material.dart';

class LikeResult {
  final List<Like> likes;
  final bool isLikedToThisPost;
  LikeResult({this.likes, this.isLikedToThisPost});
}

class Like {
  String likeId;
  String likedPostId;
  String likeUserId;
  DateTime likeDateTime;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Like({
    @required this.likeId,
    @required this.likedPostId,
    @required this.likeUserId,
    @required this.likeDateTime,
  });

  Like copyWith({
    String likeId,
    String likedPostId,
    String likeUserId,
    DateTime likeDateTime,
  }) {
    return new Like(
      likeId: likeId ?? this.likeId,
      likedPostId: likedPostId ?? this.likedPostId,
      likeUserId: likeUserId ?? this.likeUserId,
      likeDateTime: likeDateTime ?? this.likeDateTime,
    );
  }

  @override
  String toString() {
    return 'Like{likeId: $likeId, likedPostId: $likedPostId, likeUserId: $likeUserId, likeDateTime: $likeDateTime}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Like &&
          runtimeType == other.runtimeType &&
          likeId == other.likeId &&
          likedPostId == other.likedPostId &&
          likeUserId == other.likeUserId &&
          likeDateTime == other.likeDateTime);

  @override
  int get hashCode =>
      likeId.hashCode ^
      likedPostId.hashCode ^
      likeUserId.hashCode ^
      likeDateTime.hashCode;

  factory Like.fromMap(Map<String, dynamic> map) {
    return new Like(
      likeId: map['likeId'] as String,
      likedPostId: map['likedPostId'] as String,
      likeUserId: map['likeUserId'] as String,
      likeDateTime: map['likeDateTime'] == null
          ? null
          : DateTime.parse(map['likeDateTime'] as String), // edited
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'likeId': this.likeId,
      'likedPostId': this.likedPostId,
      'likeUserId': this.likeUserId,
      'likeDateTime': this.likeDateTime.toIso8601String(), // edited
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
