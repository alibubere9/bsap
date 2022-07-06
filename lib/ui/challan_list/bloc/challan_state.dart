part of 'challan_bloc.dart';

abstract class ChallanState extends Equatable {
  const ChallanState();

  @override
  List<Object> get props => [];
}

class ChallanInitial extends ChallanState {}

class ChallanLoaded extends ChallanState {
  final List<ChallanModel> challans;
  ChallanLoaded({
    required this.challans,
  });
}
