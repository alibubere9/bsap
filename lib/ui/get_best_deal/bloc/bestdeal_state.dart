part of 'bestdeal_bloc.dart';

abstract class BestDealState extends Equatable {
  const BestDealState();

  @override
  List<Object> get props => [];
}

class BestDealInitial extends BestDealState {}

class LoadingBestDeal extends BestDealState {}

class NavigatedBestDeal extends BestDealState {
  final int? classifiedId;
  final int? customerId;

  NavigatedBestDeal(this.classifiedId, this.customerId);
  @override
  List<Object> get props => [classifiedId!, customerId!];
}
