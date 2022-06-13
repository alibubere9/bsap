part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  final List<CategoryModel> categories;

  HomeLoaded(this.categories);
  @override
  List<Object> get props => [categories];
}
