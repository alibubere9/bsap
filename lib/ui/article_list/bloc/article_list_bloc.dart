import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:classified_app/data/models/article.dart';
import 'package:classified_app/data/models/sub_category.dart';
import 'package:classified_app/data/repositories/interfaces/i_article_repository.dart';
import 'package:equatable/equatable.dart';
part 'article_list_event.dart';
part 'article_list_state.dart';

class ArticleListBloc extends Bloc<ArticleListEvent, ArticleListState> {
  final IArticleRepository articleRepository;
  ArticleListBloc(this.articleRepository) : super(ArticleListEmpty());

  @override
  Stream<ArticleListState> mapEventToState(
    ArticleListEvent event,
  ) async* {
    List<ArticleModel> _classifieds;
    if (event is GetArticlesBySubCategory) {
      yield ArticleListLoading();
      _classifieds =
          await articleRepository.getByCategory(event.subCategoryModel!.id!);
      if (_classifieds.isEmpty) {
        yield ArticleListEmpty();
      } else {
        yield ArticleListLoaded(_classifieds, event.subCategoryModel!.name);
      }
    } else if (event is GetArticlesByName) {
      yield ArticleListLoading();
      _classifieds = await articleRepository.getByName(event.name);
      if (_classifieds.isEmpty) {
        yield ArticleListEmpty();
      } else {
        yield ArticleListLoaded(_classifieds, event.name);
      }
      if (_classifieds.isEmpty) {
        yield ArticleListEmpty();
      } else {
        yield ArticleListLoaded(_classifieds, event.name);
      }
    } else {
      yield ArticleListEmpty();
    }
  }
}
