import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:classified_app/data/models/challan_model.dart';
import 'package:classified_app/data/repositories/interfaces/i_challan_repository.dart';

part 'challan_event.dart';
part 'challan_state.dart';

class ChallanBloc extends Bloc<ChallanEvent, ChallanState> {
  final IChallanRepository _challanRepository;
  ChallanModel selected = ChallanModel();
  ChallanBloc(
    this._challanRepository,
  ) : super(ChallanInitial()) {
    on<LoadChallan>((event, emit) async {
      emit(ChallanInitial());
      List<ChallanModel> challans = await _challanRepository.getChallans();
      emit(ChallanLoaded(challans: challans));
    });
    on<SelectChallan>((event, emit) async {
      selected = event.selectChallan;
    });
  }
}
