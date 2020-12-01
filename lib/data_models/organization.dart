import 'package:flutter/material.dart';

class Organization {
  final String organizationId;
  final String name;
  final String size;
  final String jobTitle;
  final bool isInit;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Organization({
    @required this.organizationId,
    @required this.name,
    @required this.size,
    @required this.jobTitle,
    @required this.isInit,
  });

  Organization copyWith({
    String organizationId,
    String name,
    String size,
    String jobTitle,
    bool isInit,
  }) {
    if ((organizationId == null ||
            identical(organizationId, this.organizationId)) &&
        (name == null || identical(name, this.name)) &&
        (size == null || identical(size, this.size)) &&
        (jobTitle == null || identical(jobTitle, this.jobTitle)) &&
        (isInit == null || identical(isInit, this.isInit))) {
      return this;
    }

    return new Organization(
      organizationId: organizationId ?? this.organizationId,
      name: name ?? this.name,
      size: size ?? this.size,
      jobTitle: jobTitle ?? this.jobTitle,
      isInit: isInit ?? this.isInit,
    );
  }

  @override
  String toString() {
    return 'Organization{organizationId: $organizationId, name: $name, size: $size, jobTitle: $jobTitle, isInit: $isInit}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Organization &&
          runtimeType == other.runtimeType &&
          organizationId == other.organizationId &&
          name == other.name &&
          size == other.size &&
          jobTitle == other.jobTitle &&
          isInit == other.isInit);

  @override
  int get hashCode =>
      organizationId.hashCode ^
      name.hashCode ^
      size.hashCode ^
      jobTitle.hashCode ^
      isInit.hashCode;

  factory Organization.fromMap(Map<String, dynamic> map) {
    return new Organization(
      organizationId: map['organizationId'] as String,
      name: map['name'] as String,
      size: map['size'] as String,
      jobTitle: map['jobTitle'] as String,
      isInit: map['isInit'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'organizationId': this.organizationId,
      'name': this.name,
      'size': this.size,
      'jobTitle': this.jobTitle,
      'isInit': this.isInit,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
