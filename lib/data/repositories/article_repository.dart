import 'dart:convert';
import 'package:classified_app/data/models/article.dart';
import 'package:classified_app/data/repositories/interfaces/i_article_repository.dart';
import 'package:classified_app/network/advance_http_handler/execution_handler.dart';

class ArticleRepository implements IArticleRepository {
  final ExecutionHandler _handler;

  ArticleRepository(this._handler);
  @override
  Future<List<ArticleModel>> getByCategory(int categoryId) async {
    // return MockArticles.all; //* MOCK
    String response = await _handler.getArticlesBySubCategoryId(categoryId);
    return _convertToModel(response);
  }

  @override
  Future<List<ArticleModel>> getByName(String articleSearch) async {
    // return MockArticles.all;//* MOCK
    String response = await _handler.getArticlesByName(articleSearch);
    return _convertToModel(response);
  }

  @override
  Future<ArticleModel> getById(int articleId) async {
    // return MockArticles.getbyId(articleId);//*MOCK
    String response = await _handler.getArticlesById(articleId);
    return _convertToModel(response).first;
  }

  List<ArticleModel> _convertToModel(String response) {
    List plain = jsonDecode(response);
    List<ArticleModel> _articles = [];
    plain.forEach((element) {
      _articles.add(ArticleModel.fromMap(element));
    });
    return _articles;
  }
}
