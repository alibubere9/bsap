import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:classified_app/data/models/user_model.dart';
import 'package:classified_app/data/repositories/interfaces/i_user_repository.dart';
import 'package:classified_app/services/interfaces/i_force_update.dart';
import 'package:classified_app/utils/app_messages.dart';
import 'package:classified_app/utils/system_settings.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IUserRepository _userRepository;
  final IForceUpdateService _forceUpdateService;
  AuthenticationBloc(this._userRepository, this._forceUpdateService)
      : super(InitialAuthentication());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      await SystemSettingManager.loadSystemSetings();
      if (_forceUpdateService.isSupported) {
        final bool hasToken = _userRepository.getUser() != null;
        await AppMessagesManager.loadAppMessages();

        if (hasToken) {
          User? firebaseUser = _userRepository.getUser();
          yield AuthenticatedState(firebaseUser);
        } else {
          yield Unauthenticated();
        }
      } else {
        yield ForceUpdateState();
      }
    } else if (event is AlreadyLoggedIn) {
      yield AlreadyLoggedInState();
    } else if (event is LoggedInEvent) {
      yield Loading();
      // String uid = await userRepository.getUser().then((value) => value?.uid ?? 'UID NULL');
      yield AuthenticatedState(event.firebaseUser);
    } else if (event is LoggedOutEvent) {
      await _userRepository.signOut();
      yield Loading();
      yield Unauthenticated();
    }
  }
}
