import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:classified_app/data/models/faqs_model.dart';
import 'package:classified_app/data/repositories/interfaces/i_faqs_repository.dart';

part 'faqs_event.dart';
part 'faqs_state.dart';

class FaqsBloc extends Bloc<FaqsEvent, FaqsState> {
  IFaqsRepository faqsRepository;

  FaqsBloc(
    this.faqsRepository,
  ) : super(FaqsInitial());

  @override
  Stream<FaqsState> mapEventToState(
    FaqsEvent event,
  ) async* {
    if (event is LoadFaqs) {
      yield FaqsLoading();
      List<FaqsModel> faqsList = await faqsRepository.getFaqsList();
      yield FaqsLoaded(faqsList: faqsList);
    }
  }
}
