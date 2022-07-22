part of 'faqs_bloc.dart';

abstract class FaqsState extends Equatable {
  const FaqsState();

  @override
  List<Object> get props => [];
}

class FaqsInitial extends FaqsState {}

class FaqsLoading extends FaqsState {}

class FaqsLoaded extends FaqsState {
  final List<FaqsModel>? faqsList;

  FaqsLoaded({this.faqsList});
  @override
  List<Object> get props => [faqsList!];
}
