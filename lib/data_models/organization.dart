import 'package:flutter/material.dart';

class Organization {
  final String organizationId;
  final String name;
  final String size;
  final String jobTitle;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Organization({
    @required this.organizationId,
    @required this.name,
    @required this.size,
    @required this.jobTitle,
  });

  Organization copyWith({
    String organizationId,
    String name,
    String size,
    String jobTitle,
  }) {
    if ((organizationId == null ||
            identical(organizationId, this.organizationId)) &&
        (name == null || identical(name, this.name)) &&
        (size == null || identical(size, this.size)) &&
        (jobTitle == null || identical(jobTitle, this.jobTitle))) {
      return this;
    }

    return new Organization(
      organizationId: organizationId ?? this.organizationId,
      name: name ?? this.name,
      size: size ?? this.size,
      jobTitle: jobTitle ?? this.jobTitle,
    );
  }

  @override
  String toString() {
    return 'Organization{organizationId: $organizationId, name: $name, size: $size, jobTitle: $jobTitle}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Organization &&
          runtimeType == other.runtimeType &&
          organizationId == other.organizationId &&
          name == other.name &&
          size == other.size &&
          jobTitle == other.jobTitle);

  @override
  int get hashCode =>
      organizationId.hashCode ^
      name.hashCode ^
      size.hashCode ^
      jobTitle.hashCode;

  factory Organization.fromMap(Map<String, dynamic> map) {
    return new Organization(
      organizationId: map['organizationId'] as String,
      name: map['name'] as String,
      size: map['size'] as String,
      jobTitle: map['jobTitle'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'organizationId': this.organizationId,
      'name': this.name,
      'size': this.size,
      'jobTitle': this.jobTitle,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
