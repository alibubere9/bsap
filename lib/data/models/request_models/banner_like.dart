import 'dart:convert';

class BannerLike {
  final int customerId;
  final int bannerId;
  final bool isLiked;
  BannerLike({
    required this.customerId,
    required this.bannerId,
    required this.isLiked,
  });

  BannerLike copyWith({
    int? customerId,
    int? bannerId,
    bool? isLiked,
  }) {
    return BannerLike(
      customerId: customerId ?? this.customerId,
      bannerId: bannerId ?? this.bannerId,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'customerId': customerId,
      'bannerId': bannerId,
      'isLiked': isLiked,
    };
  }

  factory BannerLike.fromMap(Map<String, dynamic> map) {
    return BannerLike(
      customerId: map['customerId'],
      bannerId: map['bannerId'],
      isLiked: map['isLiked'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerLike.fromJson(String source) => BannerLike.fromMap(json.decode(source));

  @override
  String toString() => 'BannerLike(customerId: $customerId, bannerId: $bannerId, isLiked: $isLiked)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BannerLike &&
      other.customerId == customerId &&
      other.bannerId == bannerId &&
      other.isLiked == isLiked;
  }

  @override
  int get hashCode => customerId.hashCode ^ bannerId.hashCode ^ isLiked.hashCode;
}
