import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:classified_app/data/repositories/interfaces/i_entry_section_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:classified_app/data/models/category.dart';
import 'package:classified_app/data/repositories/interfaces/i_category_repository.dart';

import '../../../data/models/mtr_entry_section.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IEntrySectionRepository _entrySectionRepository;
  HomeBloc(
    this._entrySectionRepository,
  ) : super(HomeLoading());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    yield HomeLoading();
    //await _entrySectionRepository.allCategories;
    final List<EntrySectionModel>? entrySectionList =
        _entrySectionRepository.entrySectionList();
    if (event is LoadHome) {
      yield HomeLoading();
      yield HomeLoaded(entrySectionList: entrySectionList);
    }
  }
}
