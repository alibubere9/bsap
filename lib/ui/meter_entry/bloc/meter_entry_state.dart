part of 'meter_entry_bloc.dart';

abstract class MeterEntryState extends Equatable {
  const MeterEntryState();

  @override
  List<Object?> get props => [];
}

class MeterEntryInitial extends MeterEntryState {}

class MeterEntryListState extends MeterEntryState {
  final List<MeterEntryModel>? meterEntryList;

  MeterEntryListState(this.meterEntryList);
  @override
  List<Object?> get props => [meterEntryList];
}

class MeterEntryByBarcodeState extends MeterEntryState {
  final int? index;
  final MeterEntryModel? meterEntry;

  MeterEntryByBarcodeState(this.meterEntry, this.index);
  @override
  List<Object?> get props => [meterEntry, index];
}

class BarcodeAlreadyScannedState extends MeterEntryState {
  final String? snackBarMessage;

  BarcodeAlreadyScannedState( this.snackBarMessage);
  @override
  List<Object?> get props => [snackBarMessage];
}
