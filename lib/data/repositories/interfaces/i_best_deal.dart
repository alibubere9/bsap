import 'package:classified_app/data/models/best_deal.dart';

abstract class IBestDealRepository {
  Future<String> getBestDeal(BestDealModel bestDealModel);
}
