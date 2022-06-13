part of 'article_list_bloc.dart';

abstract class ArticleListState extends Equatable {
  const ArticleListState();

  @override
  List<Object> get props => [];
}

class ArticleListEmpty extends ArticleListState {}

class ArticleListLoaded extends ArticleListState {
  final List<ArticleModel> articles;
  final String? text;

  ArticleListLoaded(
    this.articles,
    this.text,
  );
  @override
  List<Object> get props => [articles];
}

class ArticleListLoading extends ArticleListState {}
