import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MeterEntryModel extends Equatable {
  int? srNo;
  String? takhaNo;
  String? barCode;
  String? meter;
  String? weight;
  String? numberOfTP;
  String? remark;
  MeterEntryModel(
      {this.srNo,
      this.takhaNo,
      this.barCode,
      this.meter,
      this.weight,
      this.numberOfTP,
      this.remark});

  MeterEntryModel copyWith({
    int? srNo,
    String? takhaNo,
    String? barCode,
    String? meter,
    String? weight,
    String? numberOfTP,
    String? remark,
  }) {
    return MeterEntryModel(
      srNo: srNo ?? this.srNo,
      takhaNo: takhaNo ?? this.takhaNo,
      barCode: barCode ?? this.barCode,
      meter: meter ?? this.meter,
      weight: weight ?? this.weight,
      numberOfTP: numberOfTP ?? this.numberOfTP,
      remark: remark ?? this.remark,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'srNo': srNo,
      'takhaNo': takhaNo,
      'barCode': barCode,
      'meter': meter,
      'weight': weight,
      'numberOfTP': numberOfTP,
      'remark': remark,
    };
  }

  factory MeterEntryModel.fromMap(Map<String, dynamic> map) {
    return MeterEntryModel(
      srNo: map['srNo']?.toInt(),
      takhaNo: map['takhaNo']?.toInt(),
      barCode: map['barCode'],
      meter: map['meter'],
      weight: map['weight'],
      numberOfTP: map['numberOfTP'],
      remark: map['remark'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MeterEntryModel.fromJson(String source) =>
      MeterEntryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MeterEntryModel(srNo: $srNo, takhaNo: $takhaNo, barCode: $barCode, meter: $meter, weight: $weight, numberOfTP: $numberOfTP, remark: $remark)';
  }

  @override
  List<Object?> get props {
    return [
      srNo,
      takhaNo,
      barCode,
      meter,
      weight,
      numberOfTP,
      remark,
    ];
  }
}
