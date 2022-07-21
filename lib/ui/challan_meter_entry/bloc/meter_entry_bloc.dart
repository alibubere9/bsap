import 'package:bloc/bloc.dart';
import 'package:classified_app/data/models/meter_entry_model.dart';
import 'package:classified_app/data/repositories/interfaces/i_meter_entry_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'meter_entry_event.dart';
part 'meter_entry_state.dart';

class MeterEntryBloc extends Bloc<MeterEntryEvent, MeterEntryState> {
  final IMeterEntryRepository meterEntryRepository;
  final SharedPreferences preferences;
  int? peices;
  MeterEntryBloc(this.meterEntryRepository, this.preferences)
      : super(MeterEntryInitial()) {
    on<MeterEntryEvent>((event, emit) {});

    on<GetToSubmissionReviewPage>((event, emit) {
      List<MeterEntryModel> meterEntryList = event.meterEntryList!;
      emit(MeterEntryListState(meterEntryList));
    });

    on<SendBarcodeNumberEvent>((event, emit) {
      MeterEntryModel meterEntryModel = meterEntryRepository
          .getMeterEntryByBarcodeNumber(event.barcodeNumber!);

      emit(MeterEntryByBarcodeState(meterEntryModel, event.index));
    });

    on<BarcodeAlreadyScannedEvent>((event, emit) {
      emit(BarcodeAlreadyScannedState(event.snackBarMessage));
    });
  }
}
