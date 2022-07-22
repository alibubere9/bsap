import 'package:classified_app/data/models/bale_model.dart';

abstract class IBaleRepository {
  Future<List<BaleModel>> getBales();
}
