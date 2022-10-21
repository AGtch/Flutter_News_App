part of 'settings_cubit.dart';

abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class ChangeThemeState extends SettingsState {
  bool isDark;

  ChangeThemeState({required this.isDark});
}

class ChangeCountryState extends SettingsState {
  String country;

  ChangeCountryState({required this.country});
}

class ChangeLanguageState extends SettingsState {
  String language;

  ChangeLanguageState({required this.language});
}
