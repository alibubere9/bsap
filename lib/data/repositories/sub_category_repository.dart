import 'dart:convert';

import 'package:classified_app/data/models/sub_category.dart';
import 'package:classified_app/data/repositories/interfaces/i_sub_category_repository.dart';
import 'package:classified_app/network/advance_http_handler/execution_handler.dart';

class SubCategoryRepository implements ISubCategoryRepository {
  ExecutionHandler _handler;
  SubCategoryRepository(this._handler);
  @override
  Future<List<SubCategoryModel>> getSubCategories(int categoryId) async {
    
    String response = await _handler.getAllSubCategories(categoryId);
    List<SubCategoryModel> _subCategories = _convertJsonToSubCategory(response);
    return _subCategories;
  }

  List<SubCategoryModel> _convertJsonToSubCategory(String response) {
     List _rawJsonList = jsonDecode(response);
    List<SubCategoryModel> _subCategories = [];
    _rawJsonList.forEach((element) {
      _subCategories.add(SubCategoryModel.fromMap(element));
    });
    return _subCategories;
  }
}
