part of 'bale_bloc.dart';

abstract class BaleState extends Equatable {
  const BaleState();

  @override
  List<Object> get props => [];
}

class BaleInitial extends BaleState {}

class BalesListLoaded extends BaleState {
  final List<BaleModel> bales;
  BalesListLoaded({
    required this.bales,
  });
}
