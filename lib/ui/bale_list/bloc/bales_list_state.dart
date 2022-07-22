part of 'bales_list_bloc.dart';

abstract class BalesListState extends Equatable {
  const BalesListState();

  @override
  List<Object> get props => [];
}

class BalesListInitial extends BalesListState {}

class BalesListLoaded extends BalesListState {
  final List<BaleModel> balesList;
  BalesListLoaded({
    required this.balesList,
  });
}
