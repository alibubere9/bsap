import 'dart:convert';

import 'package:equatable/equatable.dart';

class SubCategoryModel extends Equatable {
  final int? id;
  final int? categoryId;
  final String? name;

  SubCategoryModel({
    this.id,
    this.categoryId,
    this.name,
  });

  SubCategoryModel copyWith({
    int? id,
    int? iconId,
    String? name,
  }) {
    return SubCategoryModel(
      id: id ?? this.id,
      categoryId: iconId ?? this.categoryId,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'CategoryID': categoryId,
      'Name': name,
    };
  }

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
      id: map['Id'],
      categoryId: map['CategoryID'],
      name: map['Name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategoryModel.fromJson(String source) =>
      SubCategoryModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, categoryId, name];
}
