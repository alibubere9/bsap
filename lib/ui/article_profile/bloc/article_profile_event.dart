part of 'article_profile_bloc.dart';

abstract class ArticleProfileEvent extends Equatable {
  const ArticleProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadArticle extends ArticleProfileEvent {
  final int id;

  LoadArticle(this.id);

  @override
  List<Object> get props => [id];
}
