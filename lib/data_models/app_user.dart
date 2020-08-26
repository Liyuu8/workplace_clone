import 'package:flutter/material.dart';

class AppUser {
  final String userId;
  final String fullName;
  final String email;
  final String password;
  final String photoUrl;
  final String bio;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const AppUser({
    @required this.userId,
    @required this.fullName,
    @required this.email,
    @required this.password,
    @required this.photoUrl,
    @required this.bio,
  });

  AppUser copyWith({
    String userId,
    String fullName,
    String email,
    String password,
    String photoUrl,
    String bio,
  }) {
    if ((userId == null || identical(userId, this.userId)) &&
        (fullName == null || identical(fullName, this.fullName)) &&
        (email == null || identical(email, this.email)) &&
        (password == null || identical(password, this.password)) &&
        (photoUrl == null || identical(photoUrl, this.photoUrl)) &&
        (bio == null || identical(bio, this.bio))) {
      return this;
    }

    return new AppUser(
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      photoUrl: photoUrl ?? this.photoUrl,
      bio: bio ?? this.bio,
    );
  }

  @override
  String toString() {
    return 'AppUser{userId: $userId, fullName: $fullName, email: $email, password: $password, photoUrl: $photoUrl, bio: $bio}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppUser &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          fullName == other.fullName &&
          email == other.email &&
          password == other.password &&
          photoUrl == other.photoUrl &&
          bio == other.bio);

  @override
  int get hashCode =>
      userId.hashCode ^
      fullName.hashCode ^
      email.hashCode ^
      password.hashCode ^
      photoUrl.hashCode ^
      bio.hashCode;

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return new AppUser(
      userId: map['userId'] as String,
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      photoUrl: map['photoUrl'] as String,
      bio: map['bio'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'userId': this.userId,
      'fullName': this.fullName,
      'email': this.email,
      'password': this.password,
      'photoUrl': this.photoUrl,
      'bio': this.bio,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
