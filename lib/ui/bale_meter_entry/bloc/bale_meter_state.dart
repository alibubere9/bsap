part of 'bale_meter_bloc.dart';

abstract class BaleMeterState extends Equatable {
  const BaleMeterState();
  
  @override
  List<Object?> get props => [];
}

class BaleMeterInitial extends BaleMeterState {}

class BaleMeterEntryListState extends BaleMeterState {
  final List<MeterEntryModel>? meterEntryList;

  BaleMeterEntryListState(this.meterEntryList);
  @override
  List<Object?> get props => [meterEntryList];
}

class BaleMeterEntryByBarcodeState extends BaleMeterState {
  final int? index;
  final MeterEntryModel? meterEntry;

  BaleMeterEntryByBarcodeState(this.meterEntry, this.index);
  @override
  List<Object?> get props => [meterEntry, index];
}
