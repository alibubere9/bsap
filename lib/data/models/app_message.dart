import 'dart:convert';

import 'package:equatable/equatable.dart';

class AppMessage extends Equatable {
  // final int id;
  final String? key;
  final String? message;
  AppMessage({
    // required this.id,
    required this.key,
    required this.message,
  });

  AppMessage copyWith({
    // int? id,
    String? key,
    String? message,
  }) {
    return AppMessage(
      // id: id ?? this.id,
      key: key ?? this.key,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'Id': id,
      'Key': key,
      'Message': message,
    };
  }

  factory AppMessage.fromMap(Map<String, dynamic> map) {
    return AppMessage(
      // id: map['Id'],
      key: map['Key'],
      message: map['Message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppMessage.fromJson(String source) =>
      AppMessage.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [key, message];
}
