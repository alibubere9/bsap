import 'dart:convert';

import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable {
  final String? review;
  final double? rating;
  final String? name;
  final int? classifiedId;
  final int? customerId;
  const ReviewModel(
      {this.review,
      this.rating,
      this.name,
      this.classifiedId,
      this.customerId});

  ReviewModel copyWith({
    int? customerId,
    String? review,
    double? rating,
    String? name,
    int? classifiedId,
  }) {
    return ReviewModel(
      review: review ?? this.review,
      customerId: customerId ?? this.customerId,
      rating: rating ?? this.rating,
      name: name ?? this.name,
      classifiedId: classifiedId ?? this.classifiedId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Review': review,
      'Rating': rating,
      'Name': name,
      'ClassifiedId': classifiedId,
      'CustomerId': customerId,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
        review: map['Review'],
        rating: map['Rating'],
        name: map['Name'],
        classifiedId: map['ClassifiedId'],
        customerId: map['CustomerId']);
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) =>
      ReviewModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [review, rating, name, classifiedId, customerId];
}
