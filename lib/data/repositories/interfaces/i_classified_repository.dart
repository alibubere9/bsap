import 'package:classified_app/data/models/classified.dart';

abstract class IClassifiedRepository {
  Future<List<ClassifiedModel>> get allClassifieds;
  Future<ClassifiedModel> getClassifieldById(int id);
  Future<List<ClassifiedModel>> getByCategory(int? categoryId);
  Future<List<ClassifiedModel>> getByName(String name);
}
