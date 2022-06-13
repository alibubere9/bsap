import 'dart:convert';

import 'package:equatable/equatable.dart';

class FaqsListModel extends Equatable {
  final List<FaqsModel>? faqsList;
  FaqsListModel({
    required this.faqsList,
  });

  FaqsListModel copyWith({
    List<FaqsModel>? faqsList,
  }) {
    return FaqsListModel(
      faqsList: faqsList ?? this.faqsList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'faqsList': faqsList?.map((x) => x.toMap()).toList(),
    };
  }

  factory FaqsListModel.fromMap(Map<String, dynamic> map) {
    return FaqsListModel(
      faqsList: List<FaqsModel>.from(
          map['faqsList']?.map((x) => FaqsModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FaqsListModel.fromJson(String source) =>
      FaqsListModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [faqsList!];
}

class FaqsModel extends Equatable {
  final String question;
  final String answer;
  FaqsModel({
    required this.question,
    required this.answer,
  });

  FaqsModel copyWith({
    String? question,
    String? answer,
  }) {
    return FaqsModel(
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Question': question,
      'Answer': answer,
    };
  }

  factory FaqsModel.fromMap(Map<String, dynamic> map) {
    return FaqsModel(
      question: map['Question'],
      answer: map['Answer'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FaqsModel.fromJson(String source) =>
      FaqsModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [question, answer];
}
