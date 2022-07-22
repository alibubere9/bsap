part of 'meter_actual_bloc.dart';

abstract class MeterActualState extends Equatable {
  const MeterActualState();

  @override
  List<Object> get props => [];
}

class MeterActualInitial extends MeterActualState {}

class JobeerLoaded extends MeterActualState {
  final List<Jobber> jobbers;
  JobeerLoaded({
    required this.jobbers,
  });
}
