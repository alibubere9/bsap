part of 'sub_category_bloc.dart';

abstract class SubCategoryEvent extends Equatable {
  const SubCategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadSubCategories extends SubCategoryEvent {
  final CategoryModel category;
  LoadSubCategories({
    required this.category,
  });
  @override
  List<Object> get props => [category];
}
