import 'dart:convert';
import 'package:equatable/equatable.dart';

class BannerAd extends Equatable {
  final int? id;
  final String? title;
  final String? shortDescription;
  final String? longDescription;
  final List<String>? images;
  final int? likeCount;
  final bool? isLiked;
  const BannerAd({
    this.id,
    this.title,
    this.shortDescription,
    this.longDescription,
    this.images,
    this.likeCount,
    this.isLiked,
  });

  BannerAd copyWith({
    int? id,
    String? title,
    String? shortDescription,
    String? longDescription,
    List<String>? images,
    int? likeCount,
    bool? isLiked,
  }) {
    return BannerAd(
      id: id ?? this.id,
      title: title ?? this.title,
      shortDescription: shortDescription ?? this.shortDescription,
      longDescription: longDescription ?? this.longDescription,
      images: images ?? this.images,
      likeCount: likeCount ?? this.likeCount,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'Title': title,
      'ShortDescription': shortDescription,
      'LongDescription': longDescription,
      'Images': images,
      'LikeCount': likeCount,
      'IsLiked': isLiked,
    };
  }

  factory BannerAd.fromMap(Map<String, dynamic> map) {
    return BannerAd(
      id: map['Id'],
      title: map['Title'],
      shortDescription: map['ShortDescription'],
      longDescription: map['LongDescription'],
      images: List<String>.from(map['Images']),
      likeCount: map['LikeCount'],
      isLiked: map['IsLiked'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerAd.fromJson(String source) =>
      BannerAd.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      shortDescription,
      longDescription,
      images,
      likeCount,
      isLiked,
    ];
  }
}
