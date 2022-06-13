part of 'classified_profile_bloc.dart';

abstract class ClassifiedProfileState extends Equatable {
  const ClassifiedProfileState();

  @override
  List<Object> get props => [];
}

class ClassifiedProfileLoading extends ClassifiedProfileState {}

class ClassifiedProfileLoaded extends ClassifiedProfileState {
  final ClassifiedModel classified;
  final bool currentUserRated;

  ClassifiedProfileLoaded(this.classified, this.currentUserRated);

  @override
  List<Object> get props => [classified, currentUserRated];
}

class ClassifiedError extends ClassifiedProfileState {}
