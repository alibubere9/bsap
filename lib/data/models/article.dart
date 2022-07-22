import 'dart:convert';

import 'package:equatable/equatable.dart';

class ArticleModel extends Equatable {
  final int? id;
  final String? description;
  final String? articleUrl;
  final String? subHeading;
  final String? heading;
  final List<String>? images;
  const ArticleModel(
      {this.id,
      this.heading,
      this.articleUrl,
      this.images,
      this.description,
      this.subHeading});

  ArticleModel copyWith({
    String? articleUrl,
    int? id,
    String? heading,
    List<String>? images,
    String? subHeading,
  }) {
    return ArticleModel(
      id: id ?? this.id,
      heading: heading ?? this.heading,
      images: images ?? this.images,
      description: description ?? this.description,
      subHeading: subHeading ?? this.subHeading,
      articleUrl: articleUrl ?? this.articleUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'ArticleUrl': articleUrl,
      'ShortDescription': description,
      'SubHeading': subHeading,
      'Heading': heading,
      'Images': images,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['Id'],
      articleUrl: map['ArticleUrl'],
      heading: map['Heading'],
      description: map['ShortDescription'],
      images: List<String>.from(map['Images']),
      subHeading: map['SubHeading'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) =>
      ArticleModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      description,
      subHeading,
      articleUrl,
      heading,
      images,
    ];
  }
}
