part of 'classified_list_bloc.dart';

abstract class ClassifiedListState extends Equatable {
  const ClassifiedListState();

  @override
  List<Object> get props => [];
}

class ClassifiedListEmpty extends ClassifiedListState {}

class ClassifiedListLoaded extends ClassifiedListState {
  final List<ClassifiedModel> classifieds;
  final String? text;

  ClassifiedListLoaded(
    this.classifieds,
    this.text,
  );
  @override
  List<Object> get props => [classifieds];
}

class ClassifiedListLoading extends ClassifiedListState {}
