import 'package:bloc/bloc.dart';
import 'package:classified_app/data/models/bale_model.dart';
import 'package:classified_app/data/repositories/interfaces/i_bale_repository.dart';
import 'package:equatable/equatable.dart';

part 'bales_list_event.dart';
part 'bales_list_state.dart';

class BalesListBloc extends Bloc<BalesListEvent, BalesListState> {
  final IBaleRepository baleRepository;
  BaleModel selected = BaleModel();
  BalesListBloc(this.baleRepository) : super(BalesListInitial()) {
    on<LoadBalesList>((event, emit) async {
      emit(BalesListInitial());
      List<BaleModel> balesList = await baleRepository.getBales();
      emit(BalesListLoaded(balesList: balesList));
    });
    on<SelectBaleSlip>((event, emit) {
      selected = event.selectedBale;
    });
  }
}
