part of 'company_selection_bloc.dart';

abstract class CompanySelectionState extends Equatable {
  const CompanySelectionState();

  @override
  List<Object> get props => [];
}

class CompanySelectionInitial extends CompanySelectionState {}

class CARLoading extends CompanySelectionState {}
 
class SelectCompanyOnPageOne extends CompanySelectionState {
  final CompanyRoleModel? companyRoleModel;
  final List<CompanySelectionViewModel>? cprlViewModel;

  SelectCompanyOnPageOne(this.companyRoleModel, this.cprlViewModel);

  @override
  List<Object> get props => [companyRoleModel!, cprlViewModel!];
}


class SelectRoleOnPageTwo extends CompanySelectionState {
  final String? companyName;
  final List<String>? rolesList;
  final int? moduleType;

  SelectRoleOnPageTwo(this.rolesList, this.companyName,this.moduleType);

  @override
  List<Object> get props => [rolesList!, companyName!,moduleType!];
}

class SelectModuleOnPageThree extends CompanySelectionState {
  final List<String>? modulesList;

  SelectModuleOnPageThree(this.modulesList);

  @override
  List<Object> get props => [modulesList!];
}