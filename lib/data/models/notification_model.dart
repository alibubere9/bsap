import 'dart:convert';

import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  final int? id;
  final String? title;
  final String? text;
  final String? customerName;
  final int? classifiedId;
  final String? image;
  final bool isViewed;

  NotificationModel({
    this.id,
    this.title,
    this.text,
    this.customerName,
    this.classifiedId,
    this.image,
    required this.isViewed,
  });

  NotificationModel copyWith({
    int? id,
    String? title,
    String? text,
    String? customerName,
    int? classifiedId,
    String? image,
    bool? isViewed,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      text: text ?? this.text,
      customerName: customerName ?? this.customerName,
      classifiedId: classifiedId ?? this.classifiedId,
      image: image ?? this.image,
      isViewed: isViewed ?? this.isViewed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'Title': title,
      'Text': text,
      'CustomerName': customerName,
      'ClassifiedId': classifiedId,
      'ImageURL': image,
      'IsViewed': isViewed,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['Id'],
      title: map['Title'],
      text: map['Text'],
      customerName: map['CustomerName'],
      classifiedId: map['ClassifiedId'],
      image: map['ImageURL'],
      isViewed: map['IsViewed'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      text,
      customerName,
      classifiedId,
      image,
      isViewed,
    ];
  }
}
