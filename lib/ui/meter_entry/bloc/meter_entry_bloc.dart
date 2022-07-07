import 'package:bloc/bloc.dart';
import 'package:classified_app/data/models/meter_entry_model.dart';
import 'package:classified_app/data/repositories/interfaces/i_meter_entry_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'meter_entry_event.dart';
part 'meter_entry_state.dart';

class MeterEntryBloc extends Bloc<MeterEntryEvent, MeterEntryState> {
  final IMeterEntryRepository meterEntryRepository;
  int? peices;
  MeterEntryBloc(this.meterEntryRepository) : super(MeterEntryInitial()) {
    on<MeterEntryEvent>((event, emit) {});
    final List<MeterEntryModel> _meterEntryList =
        List.generate(peices!, (int index) {
      return MeterEntryModel();
    });

    on<GetToMeterEntryPage>((event, emit) {
      int pageNo = event.pageNumber!;
      List<MeterEntryModel> tempList = [];
      peices = event.peices;

      // for (var i = initialIndex; i < comp; i++) {
      //   tempList.add(_meterEntryList[i]);
      // }
      emit(MeterEntryListState(pageNo, tempList));
    });
  }
}
