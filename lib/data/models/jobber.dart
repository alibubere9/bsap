import 'dart:convert';

import 'package:equatable/equatable.dart';

class Jobber extends Equatable {
  final int? id;
  final String? name;

  const Jobber({this.id, this.name});

  factory Jobber.fromMap(Map<String, dynamic> data) => Jobber(
        id: data['id'] as int?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Jobber].
  factory Jobber.fromJson(String data) {
    return Jobber.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Jobber] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name];

  Jobber copyWith({
    int? id,
    String? name,
  }) {
    return Jobber(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
