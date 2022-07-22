part of 'category_list_bloc.dart';

abstract class CategoryListState extends Equatable {
  const CategoryListState();

  @override
  List<Object> get props => [];
}

class CategoryListLoading extends CategoryListState {}

class CategoryListLoaded extends CategoryListState {
  final List<CategoryModel> categories;

  CategoryListLoaded(this.categories);
  @override
  List<Object> get props => [categories];
}
