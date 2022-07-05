import 'dart:convert';

import 'package:equatable/equatable.dart';

class ChallanModel extends Equatable {
  final int? challanNo;
  final String? party;
  final String? item;
  final String? desgin;
  final int? pcs;

  const ChallanModel({
    this.challanNo,
    this.party,
    this.item,
    this.desgin,
    this.pcs,
  });

  factory ChallanModel.fromMap(Map<String, dynamic> data) => ChallanModel(
        challanNo: data['challan_no'] as int?,
        party: data['party'] as String?,
        item: data['item'] as String?,
        desgin: data['desgin'] as String?,
        pcs: data['Pcs'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'challan_no': challanNo,
        'party': party,
        'item': item,
        'desgin': desgin,
        'Pcs': pcs,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ChallanModel].
  factory ChallanModel.fromJson(String data) {
    return ChallanModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ChallanModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ChallanModel copyWith({
    int? challanNo,
    String? party,
    String? item,
    String? desgin,
    int? pcs,
  }) {
    return ChallanModel(
      challanNo: challanNo ?? this.challanNo,
      party: party ?? this.party,
      item: item ?? this.item,
      desgin: desgin ?? this.desgin,
      pcs: pcs ?? this.pcs,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [challanNo, party, item, desgin, pcs];
}
