part of 'article_profile_bloc.dart';

abstract class ArticleProfileState extends Equatable {
  const ArticleProfileState();

  @override
  List<Object> get props => [];
}

class ArticleProfileLoading extends ArticleProfileState {}

class ArticleProfileLoaded extends ArticleProfileState {
  final ArticleModel article;

  ArticleProfileLoaded(this.article);

  @override
  List<Object> get props => [article];
}

class ArticleError extends ArticleProfileState {}
