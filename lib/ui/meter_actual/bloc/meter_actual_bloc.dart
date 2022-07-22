import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

import 'package:classified_app/data/models/jobber.dart';
import 'package:classified_app/data/repositories/interfaces/i_jobber_repository.dart';

part 'meter_actual_event.dart';
part 'meter_actual_state.dart';

class MeterActualBloc extends Bloc<MeterActualEvent, MeterActualState> {
  final IJobberRepository _jobberRepository;
  MeterActualBloc(
    this._jobberRepository,
  ) : super(MeterActualInitial()) {
    on<GetJobbers>((event, emit) async {
      emit(MeterActualInitial());
      List<Jobber> jobbers = await _jobberRepository.getAllJobbers();
      emit(JobeerLoaded(jobbers: jobbers));
    });
  }
}
