part of 'challan_bloc.dart';

abstract class ChallanEvent extends Equatable {
  const ChallanEvent();

  @override
  List<Object> get props => [];
}

class LoadChallan extends ChallanEvent {}

class SelectChallan extends ChallanEvent {
  final ChallanModel selectChallan;

  SelectChallan(this.selectChallan);

  @override
  List<Object> get props => [selectChallan];
}
