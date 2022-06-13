import 'dart:convert';

import 'package:equatable/equatable.dart';

class Carousel extends Equatable {
  final int? id;
  final String? imageUrl;
  final int? classifiedId;
  Carousel({
    required this.id,
    required this.imageUrl,
    required this.classifiedId,
  });

  Carousel copyWith({
    int? id,
    String? imageUrl,
    int? classifiedId,
  }) {
    return Carousel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      classifiedId: classifiedId ?? this.classifiedId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'ImageUrl': imageUrl,
      'ClassifiedId': classifiedId,
    };
  }

  factory Carousel.fromMap(Map<String, dynamic> map) {
    return Carousel(
      id: map['Id'],
      imageUrl: map['ImageUrl'],
      classifiedId: map['ClassifiedId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Carousel.fromJson(String source) =>
      Carousel.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, imageUrl, classifiedId];
}
