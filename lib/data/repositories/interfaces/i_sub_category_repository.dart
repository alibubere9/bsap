import 'package:classified_app/data/models/sub_category.dart';

abstract class ISubCategoryRepository {
  Future<List<SubCategoryModel>> getSubCategories(int categoryId);
}
