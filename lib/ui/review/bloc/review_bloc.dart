import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:classified_app/data/models/review.dart';
import 'package:classified_app/data/models/user_model.dart';
import 'package:classified_app/data/repositories/interfaces/i_review_repository.dart';
import 'package:classified_app/data/repositories/interfaces/i_user_repository.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final IReviewRepository reviewRepository;
  final IUserRepository userRepository;
  ReviewBloc(
    this.reviewRepository,
    this.userRepository,
  ) : super(ReviewInitial());

  @override
  Stream<ReviewState> mapEventToState(
    ReviewEvent event,
  ) async* {
    UserModel user = userRepository.user!;
    int id = user.id!;
    if (event is SendReviewEvent) {
      yield ReviewLoading();
      await reviewRepository.sendReview(
          event.reviewModel!.copyWith(customerId: id), id);

      yield ReviewLoaded();
    }
  }
}
