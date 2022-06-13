import 'package:classified_app/data/models/category.dart';

class MockCategories {
  MockCategories._();
  static List<CategoryModel> _categories = [
    CategoryModel(id: 1, iconId: 7, name: 'Shopping'),
    CategoryModel(id: 2, iconId: 12, name: 'Food'),
    CategoryModel(id: 3, iconId: 8, name: 'Groceries'),
    CategoryModel(id: 4, iconId: 20, name: 'Income Tax Consultants'),
    CategoryModel(id: 5, iconId: 14, name: 'Foreign Exchange'),
    CategoryModel(id: 6, iconId: 9, name: 'Doctors'),
    CategoryModel(id: 7, iconId: 2, name: 'Eye Care'),
    CategoryModel(id: 8, iconId: 21, name: 'Dieticians'),
    CategoryModel(id: 9, iconId: 10, name: 'Builders & Contactors'),
    CategoryModel(id: 10, iconId: 16, name: 'AC Service'),
    CategoryModel(id: 11, iconId: 3, name: 'Hotels'),
    CategoryModel(id: 12, iconId: 4, name: 'Travel'),
    CategoryModel(id: 13, iconId: 19, name: 'Repairs & Services'),
    CategoryModel(id: 14, iconId: 15, name: 'Consultants'),
    CategoryModel(id: 15, iconId: 17, name: 'Banquets'),
    CategoryModel(id: 16, iconId: 11, name: 'Caterors'),
    CategoryModel(id: 17, iconId: 13, name: 'Event Organisers'),
    CategoryModel(id: 18, iconId: 18, name: 'Medecines'),
    CategoryModel(id: 19, iconId: 5, name: 'Tea'),
    CategoryModel(id: 20, iconId: 6, name: 'Sound Systems'),
  ]..sort((a, b) => a.name!.compareTo(b.name!));

  static List<CategoryModel> get categoriesForGrid =>
      _categories.sublist(0, 16);
  static List<CategoryModel> get allCategories => _categories;
  static List<CategoryModel> get bhiwandiSpecifiedCategories {
    List<CategoryModel> categories = _categories.sublist(0, 10);
    List<CategoryModel> bhiwandiCategories = [];
    categories.forEach((element) {
      bhiwandiCategories.add(element.copyWith(isSpecialCategory: true));
    });
    return bhiwandiCategories;
  }
}
