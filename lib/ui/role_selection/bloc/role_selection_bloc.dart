import 'package:bloc/bloc.dart';
import 'package:classified_app/data/models/company_role_model.dart';
import 'package:classified_app/data/repositories/interfaces/i_company_selection_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/company_selection_veiwModel.dart';

part 'role_selection_event.dart';
part 'role_selection_state.dart';

class RoleSelectionBloc extends Bloc<RoleSelectionEvent, RoleSelectionState> {
  final ICompanySelectionRepository companySelectionRepository;
  RoleSelectionBloc(this.companySelectionRepository)
      : super(RoleSelectionInitial()) {
    on<RoleSelectionEvent>((event, emit) {
      // TODO: implement event handler
    });

    
  }
}
