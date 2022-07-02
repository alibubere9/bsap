part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  final List<EntrySectionModel>? entrySectionList;

  HomeLoaded({this.entrySectionList});
  @override
  List<Object> get props => [entrySectionList!];
}
