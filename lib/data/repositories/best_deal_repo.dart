import 'package:classified_app/data/models/best_deal.dart';
import 'package:classified_app/data/repositories/interfaces/i_best_deal.dart';
import 'package:classified_app/network/advance_http_handler/execution_handler.dart';

class BestDealRepository extends IBestDealRepository {
  final ExecutionHandler _handler;
  BestDealRepository(
    this._handler,
  );

  Future<String> getBestDeal(BestDealModel bestDealModel) async {
    String response = await _handler.bestDeal(bestDealModel);
    return response;
  }
}
