part of 'company_selection_bloc.dart';

abstract class CompanySelectionEvent extends Equatable {
  const CompanySelectionEvent();

  @override
  List<Object> get props => [];
}

class SelectCompanyEvent extends CompanySelectionEvent {
  SelectCompanyEvent();

  @override
  List<Object> get props => [];
}

class SelectRoleEvent extends CompanySelectionEvent {
  final String? companyName;
  final String? roles;
  final int? moduleType;

  SelectRoleEvent(this.roles, this.companyName,this.moduleType);

  @override
  List<Object> get props => [roles!, companyName!,moduleType!];
}

class SelectModuleEvent extends CompanySelectionEvent {
  final int? moduleValue;

  SelectModuleEvent(this.moduleValue);

  @override
  List<Object> get props => [moduleValue!];
}
