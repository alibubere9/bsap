import 'dart:convert';

import 'package:equatable/equatable.dart';

class SystemSetting extends Equatable {
  final int id;
  final String settingType;
  final String name;
  final String value;
  final String comments;
  SystemSetting({
    required this.id,
    required this.settingType,
    required this.name,
    required this.value,
    required this.comments,
  });

  SystemSetting copyWith({
    int? id,
    String? settingType,
    String? name,
    String? value,
    String? comments,
  }) {
    return SystemSetting(
      id: id ?? this.id,
      settingType: settingType ?? this.settingType,
      name: name ?? this.name,
      value: value ?? this.value,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'SettingType': settingType,
      'Name': name,
      'Value': value,
      'Comments': comments,
    };
  }

  factory SystemSetting.fromMap(Map<String, dynamic> map) {
    return SystemSetting(
      id: map['Id'],
      settingType: map['SettingType'],
      name: map['Name'],
      value: map['Value'],
      comments: map['Comments'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SystemSetting.fromJson(String source) =>
      SystemSetting.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      settingType,
      name,
      value,
      comments,
    ];
  }
}
