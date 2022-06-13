import 'dart:convert';

import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final int? id;
  final int? iconId;
  final String? name;
  final String? color;
  final bool? isSpecialCategory;

  CategoryModel({
    this.id,
    this.iconId,
    this.name,
    this.isSpecialCategory,
    this.color });

  CategoryModel copyWith({
    int? id,
    int? iconId,
    String? name,
    bool? isSpecialCategory,
    String? color,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      iconId: iconId ?? this.iconId,
      name: name ?? this.name,
      isSpecialCategory: isSpecialCategory ?? this.isSpecialCategory,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'IsSpecialCategory': isSpecialCategory,
      'IconId': iconId,
      'Name': name,
      'IconColor' : color,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['Id'],
      iconId: (map['IconId'] is String) ? int.parse(map['IconId']) : map['IconId'],
      isSpecialCategory: map['IsSpecialCategory'],
      name: map['Name'],
      color: map['IconColor'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, iconId, name];
}
