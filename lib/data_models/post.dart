import 'package:flutter/material.dart';

class Post {
  String postId;
  String userId;
  String groupId;
  String imageUrl;
  String imageStoragePath;
  String content;
  DateTime postDateTime;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Post({
    @required this.postId,
    @required this.userId,
    @required this.groupId,
    @required this.imageUrl,
    @required this.imageStoragePath,
    @required this.content,
    @required this.postDateTime,
  });

  Post copyWith({
    String postId,
    String userId,
    String groupId,
    String imageUrl,
    String imageStoragePath,
    String content,
    DateTime postDateTime,
  }) {
    return new Post(
      postId: postId ?? this.postId,
      userId: userId ?? this.userId,
      groupId: groupId ?? this.groupId,
      imageUrl: imageUrl ?? this.imageUrl,
      imageStoragePath: imageStoragePath ?? this.imageStoragePath,
      content: content ?? this.content,
      postDateTime: postDateTime ?? this.postDateTime,
    );
  }

  @override
  String toString() {
    return 'Post{postId: $postId, userId: $userId, groupId: $groupId, imageUrl: $imageUrl, imageStoragePath: $imageStoragePath, content: $content, postDateTime: $postDateTime}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Post &&
          runtimeType == other.runtimeType &&
          postId == other.postId &&
          userId == other.userId &&
          groupId == other.groupId &&
          imageUrl == other.imageUrl &&
          imageStoragePath == other.imageStoragePath &&
          content == other.content &&
          postDateTime == other.postDateTime);

  @override
  int get hashCode =>
      postId.hashCode ^
      userId.hashCode ^
      groupId.hashCode ^
      imageUrl.hashCode ^
      imageStoragePath.hashCode ^
      content.hashCode ^
      postDateTime.hashCode;

  factory Post.fromMap(Map<String, dynamic> map) {
    return new Post(
      postId: map['postId'] as String,
      userId: map['userId'] as String,
      groupId: map['groupId'] as String,
      imageUrl: map['imageUrl'] as String,
      imageStoragePath: map['imageStoragePath'] as String,
      content: map['content'] as String,
      postDateTime: map['postDateTime'] == null
          ? null
          : DateTime.parse(map['postDateTime'] as String), // edited
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'postId': this.postId,
      'userId': this.userId,
      'groupId': this.groupId,
      'imageUrl': this.imageUrl,
      'imageStoragePath': this.imageStoragePath,
      'content': this.content,
      'postDateTime': this.postDateTime.toIso8601String(), // edited
    } as Map<String, dynamic>;
  }

//</editor-fold>

}

class PostLikeInfo {
  final List<String> likeUserNameList;
  final bool isLikedToThisPost;
  PostLikeInfo({this.likeUserNameList, this.isLikedToThisPost});
}
