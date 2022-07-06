import 'package:classified_app/data/mock/mock_challlan.dart';
import 'package:classified_app/data/models/challan_model.dart';

import 'interfaces/i_challan_repository.dart';

class ChallanRepository implements IChallanRepository {
  @override
  Future<List<ChallanModel>> getChallans() async {
    return MockChallan.challans;
  }
}
