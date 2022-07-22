part of 'meter_actual_bloc.dart';

abstract class MeterActualEvent extends Equatable {
  const MeterActualEvent();

  @override
  List<Object> get props => [];
}

class GetJobbers extends MeterActualEvent {}

class GetData extends MeterActualEvent {
  final int jobberId;
  final DateTime date;

  GetData(this.jobberId, this.date);
}
