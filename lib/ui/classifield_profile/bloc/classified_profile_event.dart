part of 'classified_profile_bloc.dart';

abstract class ClassifiedProfileEvent extends Equatable {
  const ClassifiedProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadClassified extends ClassifiedProfileEvent {
  final int id;

  LoadClassified(this.id);

  @override
  List<Object> get props => [id];
}
