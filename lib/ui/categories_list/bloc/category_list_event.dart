part of 'category_list_bloc.dart';

abstract class CategoryListEvent extends Equatable {
  const CategoryListEvent();

  @override
  List<Object> get props => [];
}

class LoadCategories extends CategoryListEvent {}

class BhiwandiSpecified extends CategoryListEvent {
}