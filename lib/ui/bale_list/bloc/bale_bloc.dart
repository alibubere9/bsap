import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:classified_app/data/models/bale_model.dart';
import 'package:classified_app/data/repositories/interfaces/i_bale_repository.dart';

part 'bale_event.dart';
part 'bale_state.dart';

class BaleBloc extends Bloc<BaleEvent, BaleState> {
  final IBaleRepository _baleRepository;
  BaleModel selected = BaleModel();
  BaleBloc(
    this._baleRepository,
  ) : super(BaleInitial()) {
    on<LoadBalesList>((event, emit) async {
      emit(BaleInitial());
      List<BaleModel> bales = await _baleRepository.getBales();
      emit(BalesListLoaded(bales: bales));
    });
    on<SelectBale>((event, emit) async {
      selected = event.selectBale;
    });
  }
}
