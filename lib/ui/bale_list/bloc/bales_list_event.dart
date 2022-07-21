part of 'bales_list_bloc.dart';

abstract class BalesListEvent extends Equatable {
  const BalesListEvent();

  @override
  List<Object> get props => [];
}

class LoadBalesList extends BalesListEvent {}

class SelectBaleSlip extends BalesListEvent {
  final BaleModel selectedBale;
  SelectBaleSlip(this.selectedBale);
  @override
  List<Object> get props => [selectedBale];
}
