import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:classified_app/data/models/category.dart';
import 'package:classified_app/data/repositories/interfaces/i_category_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ICategoryRepository _categoryRepository;
  HomeBloc(
       this._categoryRepository,
      )
      : super(HomeLoading());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    yield HomeLoading();
    await _categoryRepository.allCategories;
    final List<CategoryModel> categories =
        await _categoryRepository.categoriesForGrid;
    if (event is LoadHome) {
      yield HomeLoading();
      yield HomeLoaded(categories);
    } 
  }

 
}
