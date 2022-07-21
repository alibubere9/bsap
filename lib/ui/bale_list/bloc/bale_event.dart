part of 'bale_bloc.dart';

abstract class BaleEvent extends Equatable {
  const BaleEvent();

  @override
  List<Object> get props => [];
}

class LoadBalesList extends BaleEvent {}

class SelectBale extends BaleEvent {
  final BaleModel selectBale;

  SelectBale(this.selectBale);

  @override
  List<Object> get props => [selectBale];
}
