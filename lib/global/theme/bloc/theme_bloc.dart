import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:classified_app/services/interfaces/i_theme_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final IThemeService themeService;
  ThemeBloc(
    this.themeService,
  ) : super(ThemeState(ThemeMode.system));

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    await themeService.setTheme(event.isDark);
    ThemeMode themeMode = themeService.theme;
    yield ThemeState(themeMode);
  }
}
