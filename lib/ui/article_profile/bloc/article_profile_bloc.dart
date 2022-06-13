import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:classified_app/data/models/article.dart';
import 'package:classified_app/data/repositories/interfaces/i_article_repository.dart';
import 'package:equatable/equatable.dart';

part 'article_profile_event.dart';
part 'article_profile_state.dart';

class ArticleProfileBloc
    extends Bloc<ArticleProfileEvent, ArticleProfileState> {
  final IArticleRepository articleRepository;
  ArticleProfileBloc(this.articleRepository) : super(ArticleProfileLoading());

  @override
  Stream<ArticleProfileState> mapEventToState(
    ArticleProfileEvent event,
  ) async* {
    if (event is LoadArticle) {
      yield ArticleProfileLoading();
      final ArticleModel article = await articleRepository.getById(event.id);
      yield ArticleProfileLoaded(article);
    }
    // yield ClassifiedError();
  }
}
