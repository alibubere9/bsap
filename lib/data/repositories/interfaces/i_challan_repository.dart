import '../../models/challan_model.dart';

abstract class IChallanRepository {
  Future<List<ChallanModel>> getChallans();
}
