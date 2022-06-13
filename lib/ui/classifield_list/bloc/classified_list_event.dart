part of 'classified_list_bloc.dart';

abstract class ClassifiedListEvent extends Equatable {
  const ClassifiedListEvent();

  @override
  List<Object?> get props => [];
}

class GetClassifiedsBySubCategory extends ClassifiedListEvent {
  final SubCategoryModel? subCategoryModel;

  GetClassifiedsBySubCategory(this.subCategoryModel);

  @override
  List<Object?> get props => [subCategoryModel];
}

class GetClassifiedsByName extends ClassifiedListEvent {
  final String name;

  GetClassifiedsByName(this.name);

  @override
  List<Object> get props => [name];
}
