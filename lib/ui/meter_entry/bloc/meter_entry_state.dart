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
