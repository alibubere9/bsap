import 'package:bloc/bloc.dart';
import 'package:classified_app/data/enums/module_type_enum.dart';
import 'package:classified_app/data/models/company_role_model.dart';
import 'package:classified_app/data/repositories/interfaces/i_company_selection_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/company_selection_veiwModel.dart';

part 'module_selection_event.dart';
part 'module_selection_state.dart';

class ModuleSelectionBloc
    extends Bloc<ModuleSelectionEvent, ModuleSelectionState> {
  final ICompanySelectionRepository companySelectionRepository;
  ModuleSelectionBloc(this.companySelectionRepository)
      : super(ModuleSelectionInitial()) {
    on<ModuleSelectionEvent>((event, emit) {
      // TODO: implement event handler
    });

   
  }
}
