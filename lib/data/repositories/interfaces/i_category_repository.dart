import 'package:classified_app/data/models/category.dart';

abstract class ICategoryRepository {
  Future<List<CategoryModel>> get allCategories;
  Future<List<CategoryModel>> get bhiwandiSpecifiedCategories;
  Future<List<CategoryModel>> get categoriesForGrid;
}
