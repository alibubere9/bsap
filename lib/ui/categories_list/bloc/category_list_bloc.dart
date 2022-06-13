import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:classified_app/data/repositories/interfaces/i_category_repository.dart';
import 'package:equatable/equatable.dart';

import 'package:classified_app/data/models/category.dart';

part 'category_list_event.dart';
part 'category_list_state.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  final ICategoryRepository _categoryRepository;
  CategoryListBloc(
    this._categoryRepository,
  ) : super(CategoryListLoading());

  @override
  Stream<CategoryListState> mapEventToState(
    CategoryListEvent event,
  ) async* {
    if (event is BhiwandiSpecified) {
      yield CategoryListLoading();
      List<CategoryModel> categories =
          await _categoryRepository.bhiwandiSpecifiedCategories;
      yield CategoryListLoaded(categories);
    } else if (event is LoadCategories) {
      yield CategoryListLoading();
      List<CategoryModel> categories = await _categoryRepository.allCategories;
      yield CategoryListLoaded(categories);
    }
  }
}
