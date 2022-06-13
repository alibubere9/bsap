import 'dart:convert';

import 'package:classified_app/data/enums/gender_enum.dart';
import 'package:classified_app/data/enums/status_enum.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String? uid;
  final String? username;
  final String? mobileNumber;
  final Gender? gender;
  final DateTime? birthdate;
  final MaritalStatus? maritalStatus;
  final String? email;
  final String? image;
  final String? address;
  final String? deviceId;
  final String? qualification;

  UserModel(
      {this.id,
      this.uid,
      this.username,
      this.mobileNumber,
      this.gender,
      this.birthdate,
      this.maritalStatus,
      this.email,
      this.image,
      this.address,
      this.deviceId,
      this.qualification});

  @override
  List<Object?> get props => [
        qualification,
        deviceId,
        id,
        uid,
        username,
        mobileNumber,
        gender,
        birthdate,
        maritalStatus,
        email,
        image,
        address
      ];

  UserModel copyWith(
      {int? id,
      String? username,
      String? mobileNumber,
      Gender? gender,
      DateTime? birthdate,
      MaritalStatus? status,
      String? email,
      String? image,
      String? uid,
      String? deviceId,
      String? qualification,
      String? address}) {
    return UserModel(
        uid: uid ?? this.uid,
        id: id ?? this.id,
        username: username ?? this.username,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        gender: gender ?? this.gender,
        birthdate: birthdate ?? this.birthdate,
        maritalStatus: status ?? this.maritalStatus,
        email: email ?? this.email,
        image: image ?? this.image,
        deviceId: deviceId ?? this.deviceId,
        qualification: qualification ?? this.qualification,
        address: address ?? this.address);
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'Qualification': qualification,
      'UID': uid,
      'Username': username,
      'PhoneNumber': mobileNumber,
      'Gender': gender!.index,
      'Birthdate': birthdate!.toString(),
      'MaritalStatus': maritalStatus!.index,
      'Email': email,
      'Image': image,
      'Address': address,
      'DeviceId': deviceId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['Id'],
      qualification: map['Qualification'],
      username: map['Username'],
      mobileNumber: map['PhoneNumber'],
      gender: Gender.values.toList()[map['Gender']],
      birthdate:
          (map['BirthDate'] != null) ? DateTime.parse(map['BirthDate']) : null,
      maritalStatus: MaritalStatus.values.toList()[map['MaritalStatus']],
      email: map['Email'],
      image: map['Image'],
      address: map['Address'],
      uid: map['UID'],
      deviceId: map['DeviceId'],
    );
  }

  UserModel checkNew(UserModel old, UserModel newUser) {
    return UserModel(
        address: newUser.address ?? old.address,
        birthdate: newUser.birthdate ?? old.birthdate,
        email: newUser.email ?? old.email,
        gender: newUser.gender ?? old.gender,
        id: newUser.id ?? old.id,
        username: newUser.username ?? old.username,
        image: newUser.image ?? old.image,
        mobileNumber: newUser.mobileNumber ?? old.mobileNumber,
        maritalStatus: newUser.maritalStatus ?? old.maritalStatus,
        uid: newUser.uid ?? old.uid);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
