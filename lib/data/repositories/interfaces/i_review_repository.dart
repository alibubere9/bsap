import 'package:classified_app/data/models/review.dart';

abstract class IReviewRepository {
  Future<void> sendReview(ReviewModel reviewModel, int id);
}
