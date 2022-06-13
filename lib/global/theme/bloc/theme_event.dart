part of 'theme_bloc.dart';

class ThemeEvent extends Equatable {
  final bool isDark;
  const ThemeEvent(
    this.isDark,
  );

  @override
  List<Object> get props => [isDark];
}
