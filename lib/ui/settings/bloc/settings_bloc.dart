import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:classified_app/environment/environment.dart';
import 'package:equatable/equatable.dart';

import 'package:classified_app/data/repositories/interfaces/i_system_info_repository.dart';
import 'package:classified_app/environment/i_environment_switch.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final ISystemInfoRepository _systemInfoRepository;
  final IEnvironmentManager _environmentManager;
  SettingsBloc(
    this._systemInfoRepository,
    this._environmentManager,
  ) : super(SettingsLoading());

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    String appVersion = _systemInfoRepository.appVersion;
    Environment environment = _environmentManager.environment;
    if (event is LoadSettings) {
      yield SettingsLoading();
      yield SettingsLoaded(appVersion, environment);
    } else if (event is SwitchEnvironment) {
      yield SettingsLoading();
      print(environment);
      _environmentManager.switchEnvironment();
      print(environment);
      yield SettingsLoaded(appVersion, environment);
    }
  }
}
