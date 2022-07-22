import 'dart:convert';

class CompanySelectionViewModel {
  final String companyName;
  final String? roleNames;
  CompanySelectionViewModel({
    required this.companyName,
    this.roleNames,
  });

  CompanySelectionViewModel copyWith({
    String? companyName,
    String? roleNames,
  }) {
    return CompanySelectionViewModel(
      companyName: companyName ?? this.companyName,
      roleNames: roleNames ?? this.roleNames,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'companyName': companyName,
      'roleNames': roleNames,
    };
  }

  factory CompanySelectionViewModel.fromMap(Map<String, dynamic> map) {
    return CompanySelectionViewModel(
      companyName: map['companyName'] ?? '',
      roleNames: map['roleNames'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanySelectionViewModel.fromJson(String source) =>
      CompanySelectionViewModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CompanySelectionViewModel(companyName: $companyName, roleNames: $roleNames)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CompanySelectionViewModel &&
        other.companyName == companyName &&
        other.roleNames == roleNames;
  }

  @override
  int get hashCode => companyName.hashCode ^ roleNames.hashCode;
}
