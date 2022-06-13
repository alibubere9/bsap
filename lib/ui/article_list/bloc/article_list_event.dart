part of 'article_list_bloc.dart';

abstract class ArticleListEvent extends Equatable {
  const ArticleListEvent();

  @override
  List<Object?> get props => [];
}

class GetArticlesBySubCategory extends ArticleListEvent {
  final SubCategoryModel? subCategoryModel;

  GetArticlesBySubCategory(this.subCategoryModel);

  @override
  List<Object?> get props => [subCategoryModel];
}

class GetArticlesByName extends ArticleListEvent {
  final String name;

  GetArticlesByName(this.name);

  @override
  List<Object> get props => [name];
}
