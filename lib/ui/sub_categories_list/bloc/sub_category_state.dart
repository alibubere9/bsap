part of 'sub_category_bloc.dart';

abstract class SubCategoryState extends Equatable {
  const SubCategoryState();

  @override
  List<Object> get props => [];
}

class SubCategoryLoading extends SubCategoryState {}

class SubCategoryLoaded extends SubCategoryState {
  final CategoryModel category;
  final List<SubCategoryModel> subCategories;

  SubCategoryLoaded(this.category, this.subCategories);
  @override
  List<Object> get props => [category, subCategories];
}
