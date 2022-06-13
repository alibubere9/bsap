import 'package:classified_app/data/models/review.dart';
import 'package:classified_app/data/repositories/interfaces/i_review_repository.dart';
import 'package:classified_app/network/advance_http_handler/execution_handler.dart';

class ReviewRepository extends IReviewRepository {
  final ExecutionHandler _handler;
  ReviewRepository(
    this._handler,
  );

  Future<void> sendReview(ReviewModel reviewModel, int id) async {
    return await _handler.sendReview(reviewModel, id);
  }
}
