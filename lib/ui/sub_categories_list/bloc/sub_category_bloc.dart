import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:classified_app/data/models/category.dart';
import 'package:classified_app/data/models/sub_category.dart';
import 'package:classified_app/data/repositories/interfaces/i_sub_category_repository.dart';

part 'sub_category_event.dart';
part 'sub_category_state.dart';

class SubCategoryBloc extends Bloc<SubCategoryEvent, SubCategoryState> {
  final ISubCategoryRepository _subCategoryRepository;
  SubCategoryBloc(
    this._subCategoryRepository,
  ) : super(SubCategoryLoading());

  @override
  Stream<SubCategoryState> mapEventToState(
    SubCategoryEvent event,
  ) async* {
    if (event is LoadSubCategories) {
      yield SubCategoryLoading();
      final List<SubCategoryModel> _subCategories =
          await _subCategoryRepository.getSubCategories(event.category.id ?? 0);
      yield SubCategoryLoaded(event.category, _subCategories);
    }
  }
}
