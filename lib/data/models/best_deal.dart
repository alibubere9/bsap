import 'dart:convert';

import 'package:equatable/equatable.dart';

class BestDealModel extends Equatable {
  final int? customerId;
  final int? classifiedId;
  final String? name;
  final String? email;
  final String? phoneNumber;
  BestDealModel({
    this.customerId,
    this.classifiedId,
    this.name,
    this.email,
    this.phoneNumber,
  });

  

  BestDealModel copyWith({
    int? customerId,
    int? classifiedId,
    String? name,
    String? email,
    String? phoneNumber,
  }) {
    return BestDealModel(
      customerId: customerId ?? this.customerId,
      classifiedId: classifiedId ?? this.classifiedId,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'CustomerId': customerId,
      'ClassifiedId': classifiedId,
      'Name': name,
      'Email': email,
      'PhoneNumber': phoneNumber,
    };
  }

  factory BestDealModel.fromMap(Map<String, dynamic> map) {
    return BestDealModel(
      customerId: map['CustomerId'],
      classifiedId: map['ClassifiedId'],
      name: map['Name'],
      email: map['Email'],
      phoneNumber: map['PhoneNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BestDealModel.fromJson(String source) => BestDealModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      customerId,
      classifiedId,
      name,
      email,
      phoneNumber,
    ];
  }
}
