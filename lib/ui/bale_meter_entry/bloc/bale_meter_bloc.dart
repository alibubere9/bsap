import 'package:bloc/bloc.dart';
import 'package:classified_app/data/repositories/interfaces/i_bale_meter_entry_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/meter_entry_model.dart';

part 'bale_meter_event.dart';
part 'bale_meter_state.dart';

class BaleMeterBloc extends Bloc<BaleMeterEvent, BaleMeterState> {
  final IBaleMeterEntryRepository baleMeterEntryRepository;
  BaleMeterBloc(this.baleMeterEntryRepository) : super(BaleMeterInitial()) {
    on<BaleMeterEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetToBaleSubmissionReviewPage>((event, emit) {
      List<MeterEntryModel> meterEntryList = event.meterEntryList!;
      emit(BaleMeterEntryListState(meterEntryList));
    });

    on<SendBaleBarcodeNumberEvent>((event, emit) {
      MeterEntryModel meterEntryModel = baleMeterEntryRepository
          .getBaleMeterEntryByBarcodeNumber(event.barcodeNumber!);

      emit(BaleMeterEntryByBarcodeState(meterEntryModel, event.index));
    });
  }
}
