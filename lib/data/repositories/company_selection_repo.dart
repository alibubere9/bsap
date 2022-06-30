import 'dart:developer';

import 'package:classified_app/data/mock/mock_company_role.dart';
import 'package:classified_app/data/models/company_role_model.dart';
import 'package:classified_app/data/repositories/interfaces/i_company_selection_repo.dart';

class CompanySelectionRepository implements ICompanySelectionRepository {
  CompanySelectionRepository();

  @override
  CompanyRoleModel getCompaniesList() {
    CompanyRoleModel cprm = MockCompanyRole.companyRoleModel;
    log(cprm.toJson());
    return cprm;
  }
}
