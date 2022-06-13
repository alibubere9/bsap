part of 'bestdeal_bloc.dart';

abstract class BestDealEvent extends Equatable {
  const BestDealEvent();

  @override
  List<Object> get props => [];
}

class BestDealInitialEvent extends BestDealEvent {}

class NavigatingToBestDeal extends BestDealEvent {
  final int? classifiedId;

  NavigatingToBestDeal(this.classifiedId);
  @override
  List<Object> get props => [classifiedId!];
}

class SubmitBestDeal extends BestDealEvent {
  final BestDealModel? bestDealModel;

  SubmitBestDeal(this.bestDealModel);
  @override
  List<Object> get props => [bestDealModel!];
}
