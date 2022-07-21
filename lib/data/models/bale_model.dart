import 'dart:convert';

import 'package:equatable/equatable.dart';

class BaleModel extends Equatable {
  final int? baleNo;
  final String? party;
  final String? item;
  final String? desgin;
  final int? pcs;
  final int? id;

  const BaleModel({
    this.id,
    this.baleNo,
    this.party,
    this.item,
    this.desgin,
    this.pcs,
  });

  factory BaleModel.fromMap(Map<String, dynamic> data) => BaleModel(
        baleNo: data['bale_no'] as int?,
        party: data['party'] as String?,
        item: data['item'] as String?,
        desgin: data['desgin'] as String?,
        pcs: data['pcs'] as int?,
        id: data['id'] as int,
      );

  Map<String, dynamic> toMap() => {
        'bale_no': baleNo,
        'party': party,
        'item': item,
        'desgin': desgin,
        'pcs': pcs,
        'id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BaleModel].
  factory BaleModel.fromJson(String data) {
    return BaleModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BaleModel] to a JSON string.
  String toJson() => json.encode(toMap());

  BaleModel copyWith({
    int? baleNo,
    String? party,
    String? item,
    String? desgin,
    int? pcs,
  }) {
    return BaleModel(
        baleNo: baleNo ?? this.baleNo,
        party: party ?? this.party,
        item: item ?? this.item,
        desgin: desgin ?? this.desgin,
        pcs: pcs ?? this.pcs,
        id: id ?? this.id);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [baleNo, party, item, desgin, pcs];
}
