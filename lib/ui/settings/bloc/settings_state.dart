part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final String appVersion;
  final Environment environment;

  SettingsLoaded(
    this.appVersion,
    this.environment,
  );

  @override
  List<Object> get props => [appVersion,environment];
}
