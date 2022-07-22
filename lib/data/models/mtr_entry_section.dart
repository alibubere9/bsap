import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class EntrySectionModel extends Equatable {
  final int? id;
  final Icon? iconId;
  final String? name;
  final String? color;
  final String? subName;
  EntrySectionModel({
    this.id,
    this.iconId,
    this.name,
    this.color,
    this.subName,
  });

  EntrySectionModel copyWith({
    int? id,
    Icon? iconId,
    String? name,
    String? color,
    String? subName,
  }) {
    return EntrySectionModel(
      id: id ?? this.id,
      iconId: iconId ?? this.iconId,
      name: name ?? this.name,
      color: color ?? this.color,
      subName: subName ?? this.subName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'iconId': iconId,
      'name': name,
      'color': color,
      'subName': subName,
    };
  }

  factory EntrySectionModel.fromMap(Map<String, dynamic> map) {
    return EntrySectionModel(
      id: map['id']?.toInt(),
      iconId: map['iconId']?.toInt(),
      name: map['name'],
      color: map['color'],
      subName: map['subName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EntrySectionModel.fromJson(String source) =>
      EntrySectionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EntrySectionModel(id: $id, iconId: $iconId, name: $name, color: $color, subName: $subName)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      iconId,
      name,
      color,
      subName,
    ];
  }
}
