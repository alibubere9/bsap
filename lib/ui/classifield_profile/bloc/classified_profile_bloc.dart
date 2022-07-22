import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:classified_app/data/models/classified.dart';
import 'package:classified_app/data/repositories/interfaces/i_classified_repository.dart';
import 'package:classified_app/services/interfaces/i_user_service.dart';
import 'package:equatable/equatable.dart';

part 'classified_profile_event.dart';
part 'classified_profile_state.dart';

class ClassifiedProfileBloc
    extends Bloc<ClassifiedProfileEvent, ClassifiedProfileState> {
  final IClassifiedRepository classifiedRepository;
  final IUserService _userService;
  ClassifiedProfileBloc(this.classifiedRepository, this._userService)
      : super(ClassifiedProfileLoading());

  @override
  Stream<ClassifiedProfileState> mapEventToState(
    ClassifiedProfileEvent event,
  ) async* {
    yield ClassifiedProfileLoading();
    if (event is LoadClassified) {
      final ClassifiedModel classified =
          await classifiedRepository.getClassifieldById(event.id);
      bool currentUserRated = classified.reviews
              ?.any((element) => element.customerId == _userService.userId) ??
          false;
      yield ClassifiedProfileLoaded(classified, currentUserRated);
    }
    // yield ClassifiedError();
  }
}
