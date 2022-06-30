import 'package:classified_app/data/models/company_role_model.dart';

class MockCompanyRole {
  static final List<RoleModel> _rolesList = [
    RoleModel(id: 1, name: "Admin"),
    RoleModel(id: 2, name: "Staff"),
    RoleModel(id: 3, name: "Jobber"),
    RoleModel(id: 4, name: "Customer"),
  ];
  static final CompanyRoleModel _companyRoleModel =
      CompanyRoleModel(mobileNumber: "8149997223", companies: [
    CompanyModel(
        id: 1, name: "Anmol", roles: _rolesList.sublist(0, 2), moduleType: 2),
    CompanyModel(
        id: 1, name: "FT", roles: _rolesList.sublist(0, 2), moduleType: 1),
    CompanyModel(
        id: 1, name: "Lahoti", roles: _rolesList.sublist(0, 1), moduleType: 2),
    CompanyModel(
        id: 1, name: "Shandar", roles: _rolesList.sublist(0, 1), moduleType: 2),
  ]);
  static CompanyRoleModel get companyRoleModel => _companyRoleModel;
}
