part of 'drawer_bloc.dart';

abstract class DrawerState extends Equatable {
  const DrawerState();

  @override
  List<Object?> get props => [];
}

class DrawerInitial extends DrawerState {}

class DrawerInState extends DrawerState {
  final UserModel? userModel;

  DrawerInState({this.userModel});

  @override
  List<Object?> get props => [userModel];
}
