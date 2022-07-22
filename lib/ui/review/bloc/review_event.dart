part of 'review_bloc.dart';

abstract class ReviewEvent extends Equatable {
  const ReviewEvent();

  @override
  List<Object> get props => [];
}

class SendReviewEvent extends ReviewEvent {
  final ReviewModel? reviewModel;

  SendReviewEvent(this.reviewModel);
  @override
  List<Object> get props => [reviewModel!];
}
