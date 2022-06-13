import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:classified_app/data/models/best_deal.dart';
import 'package:classified_app/data/repositories/interfaces/i_best_deal.dart';
import 'package:classified_app/services/interfaces/i_user_service.dart';

part 'bestdeal_event.dart';
part 'bestdeal_state.dart';

class BestDealBloc extends Bloc<BestDealEvent, BestDealState> {
  final IUserService userService;
  final IBestDealRepository bestDealRepository;
  BestDealBloc(
    this.userService,
    this.bestDealRepository,
  ) : super(BestDealInitial());

  @override
  Stream<BestDealState> mapEventToState(
    BestDealEvent event,
  ) async* {
    if (event is NavigatingToBestDeal) {
      yield LoadingBestDeal();
      yield NavigatedBestDeal(event.classifiedId, userService.userId);
    } else if (event is SubmitBestDeal) {
      yield LoadingBestDeal();
       await bestDealRepository.getBestDeal(event.bestDealModel!);
      yield NavigatedBestDeal(
          event.bestDealModel!.classifiedId, userService.userId);
    }
  }
}
