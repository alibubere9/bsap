import 'dart:convert';

import 'package:flutter/foundation.dart';

class CompanyRoleModel {
  final String? mobileNumber;
  final List<CompanyModel>? companies;
  CompanyRoleModel({
    this.mobileNumber,
    this.companies,
  });

  CompanyRoleModel copyWith({
    String? mobileNumber,
    List<CompanyModel>? companies,
  }) {
    return CompanyRoleModel(
      mobileNumber: mobileNumber ?? this.mobileNumber,
      companies: companies ?? this.companies,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mobileNumber': mobileNumber,
      'companies': companies?.map((x) => x.toMap()).toList(),
    };
  }

  factory CompanyRoleModel.fromMap(Map<String, dynamic> map) {
    return CompanyRoleModel(
      mobileNumber: map['mobileNumber'],
      companies: map['companies'] != null
          ? List<CompanyModel>.from(
              map['companies']?.map((x) => CompanyModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyRoleModel.fromJson(String source) =>
      CompanyRoleModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CompanyRoleModel(mobileNumber: $mobileNumber, companies: $companies)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CompanyRoleModel &&
        other.mobileNumber == mobileNumber &&
        listEquals(other.companies, companies);
  }

  @override
  int get hashCode => mobileNumber.hashCode ^ companies.hashCode;
}

class CompanyModel {
  final int? id;
  final String? name;
  final List<RoleModel>? roles;
  final int? moduleType;
  CompanyModel({
    this.id,
    this.name,
    this.roles,
    this.moduleType,
  });

  CompanyModel copyWith({
    int? id,
    String? name,
    List<RoleModel>? roles,
    int? moduleType,
  }) {
    return CompanyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      roles: roles ?? this.roles,
      moduleType: moduleType ?? this.moduleType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'roles': roles?.map((x) => x.toMap()).toList(),
      'moduleType': moduleType,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      id: map['id']?.toInt(),
      name: map['name'],
      roles: map['roles'] != null ? List<RoleModel>.from(map['roles']?.map((x) => RoleModel.fromMap(x))) : null,
      moduleType: map['moduleType']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) => CompanyModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CompanyModel(id: $id, name: $name, roles: $roles, moduleType: $moduleType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CompanyModel &&
      other.id == id &&
      other.name == name &&
      listEquals(other.roles, roles) &&
      other.moduleType == moduleType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      roles.hashCode ^
      moduleType.hashCode;
  }
}

class RoleModel {
  final int? id;
  final String? name;
  RoleModel({
    this.id,
    this.name,
  });

  RoleModel copyWith({
    int? id,
    String? name,
  }) {
    return RoleModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory RoleModel.fromMap(Map<String, dynamic> map) {
    return RoleModel(
      id: map['id']?.toInt(),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RoleModel.fromJson(String source) =>
      RoleModel.fromMap(json.decode(source));

  @override
  String toString() => 'RoleModel(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RoleModel && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
