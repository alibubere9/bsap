import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:classified_app/data/models/classified.dart';
import 'package:classified_app/data/models/sub_category.dart';
import 'package:classified_app/data/repositories/interfaces/i_classified_repository.dart';
import 'package:equatable/equatable.dart';
part 'classified_list_event.dart';
part 'classified_list_state.dart';

class ClassifiedListBloc
    extends Bloc<ClassifiedListEvent, ClassifiedListState> {
  final IClassifiedRepository classifiedRepository;
  ClassifiedListBloc(this.classifiedRepository) : super(ClassifiedListEmpty());

  @override
  Stream<ClassifiedListState> mapEventToState(
    ClassifiedListEvent event,
  ) async* {
    List<ClassifiedModel> _classifieds;
    if (event is GetClassifiedsBySubCategory) {
      yield ClassifiedListLoading();
      _classifieds =
          await classifiedRepository.getByCategory(event.subCategoryModel!.id);
      if (_classifieds.isEmpty) {
        yield ClassifiedListEmpty();
      } else {
        yield ClassifiedListLoaded(_classifieds, event.subCategoryModel!.name);
      }
    } else if (event is GetClassifiedsByName) {
      yield ClassifiedListLoading();
      _classifieds = await classifiedRepository.getByName(event.name);
      if (_classifieds.isEmpty) {
        yield ClassifiedListEmpty();
      } else {
        yield ClassifiedListLoaded(_classifieds, event.name);
      }
      if (_classifieds.isEmpty) {
        yield ClassifiedListEmpty();
      } else {
        yield ClassifiedListLoaded(_classifieds, event.name);
      }
    } else {
      yield ClassifiedListEmpty();
    }
  }
}
