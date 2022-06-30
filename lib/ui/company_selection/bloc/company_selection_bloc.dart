import 'package:bloc/bloc.dart';
import 'package:classified_app/data/models/company_role_model.dart';
import 'package:classified_app/data/repositories/interfaces/i_company_selection_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/enums/module_type_enum.dart';
import '../../../data/models/company_selection_veiwModel.dart';

part 'company_selection_event.dart';
part 'company_selection_state.dart';

class CompanySelectionBloc
    extends Bloc<CompanySelectionEvent, CompanySelectionState> {
  final ICompanySelectionRepository companySelectionRepository;
  List<String>? stringRolesList = [];
  String stringRoles = "";
  String? companyName = "";
  int? moduleValue;

  CompanySelectionBloc(this.companySelectionRepository)
      : super(CompanySelectionInitial()) {
    on<CompanySelectionEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SelectCompanyEvent>((event, emit) {
      CompanyRoleModel cprlModel =
          companySelectionRepository.getCompaniesList();
      List<CompanySelectionViewModel> viewModelList = [];
      cprlModel.companies!.forEach(((element) {
        String roles = "";
        for (var rolesElement in element.roles!) {
          (element.roles!.indexOf(rolesElement) !=
                  element.roles!.indexOf(element.roles!.last))
              ? roles += rolesElement.name! + "," + " "
              : roles += rolesElement.name ?? "";
        }
        // String roles = rolesList.toString();
        viewModelList.add(CompanySelectionViewModel(
            companyName: element.name!, roleNames: roles));
      }));
      emit(CARLoading());
      emit(SelectCompanyOnPageOne(cprlModel, viewModelList));
    });

    on<SelectRoleEvent>((event, emit) {
      companyName = event.companyName;
      stringRoles = event.roles!;
      stringRolesList = stringRoles.split(",");
      moduleValue = event.moduleType;
      emit(CARLoading());
      emit(SelectRoleOnPageTwo(stringRolesList, companyName, moduleValue));
    });

    on<SelectModuleEvent>((event, emit) {
      List<String>? stringModuleList = [];
      List<String>? stringList = ["Textile", "Sizing"];
      int? index = event.moduleValue;
      ModuleType mt = ModuleType.values.elementAt(index!);
      if (mt == ModuleType.both) {
        stringList.forEach((element) {
          stringModuleList.add(element);
        });
      }
      emit(CARLoading());
      emit(SelectModuleOnPageThree(stringModuleList));
    });
  }
}
