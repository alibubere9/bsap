import 'dart:convert';

class NetworkResponse {
  final DateTime time;
  final String value;
  NetworkResponse({
    required this.time,
    required this.value,
  });

  NetworkResponse copyWith({
    DateTime? time,
    String? value,
  }) {
    return NetworkResponse(
      time: time ?? this.time,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'time': time.millisecondsSinceEpoch,
      'value': value,
    };
  }

  factory NetworkResponse.fromMap(Map<String, dynamic> map) {
    return NetworkResponse(
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NetworkResponse.fromJson(String source) =>
      NetworkResponse.fromMap(json.decode(source));

  @override
  String toString() => 'NetworkResponse(time: $time, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NetworkResponse &&
        other.time == time &&
        other.value == value;
  }

  @override
  int get hashCode => time.hashCode ^ value.hashCode;
}
