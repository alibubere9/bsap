import 'dart:convert';

import 'package:equatable/equatable.dart';

class NotificationViewedModel extends Equatable {
  final int? notificationId;
  final int? userId;
  final bool isViewed;
  NotificationViewedModel({
    this.notificationId,
    this.userId,
    required this.isViewed,
  });

  NotificationViewedModel copyWith({
    int? notificationId,
    int? userId,
    bool? isViewed,
  }) {
    return NotificationViewedModel(
      notificationId: notificationId ?? this.notificationId,
      userId: userId ?? this.userId,
      isViewed: isViewed ?? this.isViewed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'NotificationId': notificationId,
      'CustomerId': userId,
      'IsViewed': isViewed,
    };
  }

  factory NotificationViewedModel.fromMap(Map<String, dynamic> map) {
    return NotificationViewedModel(
      notificationId: map['NotificationId'],
      userId: map['CustomerId'],
      isViewed: map['IsViewed'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationViewedModel.fromJson(String source) =>
      NotificationViewedModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [notificationId, userId, isViewed];
}
