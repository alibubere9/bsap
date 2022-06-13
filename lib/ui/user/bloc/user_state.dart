part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class AuthUserLoading extends UserState {}

class NewUserState extends UserState {
  final String phoneNumber;

  NewUserState(this.phoneNumber);
  @override
  List<Object?> get props => [phoneNumber];
}

class RegisteredUserState extends UserState {
  final UserModel user;
  final bool? isNamed;
  final bool? isNumbered;
  final bool? isEmail;

  RegisteredUserState(
      {required this.user,
      this.isNamed = false,
      this.isNumbered = false,
      this.isEmail = false});
  @override
  List<Object?> get props => [user, isNamed, isNumbered, isEmail];
}

class UserLoading extends UserState {}
