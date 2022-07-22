import 'dart:convert';

import 'package:classified_app/data/models/category.dart';
import 'package:classified_app/data/repositories/interfaces/i_category_repository.dart';
import 'package:classified_app/network/advance_http_handler/execution_handler.dart';

class CategoryRepository implements ICategoryRepository {
  final ExecutionHandler _handler;
  List<CategoryModel>? _categories;
  CategoryRepository(this._handler);

  Future<List<CategoryModel>> get allCategories async {
    // return MockCategories.allCategories; //* FOR MOCK REFERENCE
    if (_categories == null) {
      String fromApi = await _handler.getAllCategories();
      List plain = jsonDecode(fromApi);
      _categories ??= _category(plain);
    }
    return _categories!
        .where((element) =>
            element.isSpecialCategory == null || !element.isSpecialCategory!)
        .toList()
      ..sort((a, b) => a.name!.compareTo(b.name!));
  }

  Future<List<CategoryModel>> get bhiwandiSpecifiedCategories async {
    // return MockCategories.bhiwandiSpecifiedCategories;//* FOR MOCK REFERENCE
    String fromApi = await _handler.getAllCategories(isSpecialCategory: true);
    List plain = jsonDecode(fromApi);
    return _category(plain)..sort((a, b) => a.name!.compareTo(b.name!));
  }

  Future<List<CategoryModel>> get categoriesForGrid async {
    // return MockCategories.categoriesForGrid;//*MOCK

    String fromApi = await _handler.getCategoriesForGrid();
    List plain = jsonDecode(fromApi);
    return _category(plain);
  }

  List<CategoryModel> _category(List plain) {
    List<CategoryModel> finalList = [];
    plain.forEach((element) {
      finalList.add(CategoryModel.fromMap(element));
    });
    return finalList;
  }
}
