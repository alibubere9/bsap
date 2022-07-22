import 'package:classified_app/data/mock/mock_bale.dart';
import '../models/bale_model.dart';
import 'interfaces/i_bale_repository.dart';

class BaleRepository implements IBaleRepository {
  @override
  Future<List<BaleModel>> getBales() async {
    return MockBale.bales;
  }
}
