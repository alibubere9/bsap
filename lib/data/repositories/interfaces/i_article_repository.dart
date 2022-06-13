import 'package:classified_app/data/models/article.dart';

abstract class IArticleRepository {
  Future<List<ArticleModel>> getByCategory(int categoryId);
  Future<ArticleModel> getById(int articleId);
  Future<List<ArticleModel>> getByName(String articleSearch);

}