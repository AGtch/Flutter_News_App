import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/data/services/local_source/shared_preferences_utils.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SharedPreferencesUtils sharedPreferencesUtils;

  SettingsCubit({required this.sharedPreferencesUtils})
      : super(SettingsInitial());

  void changeTheme({required bool isDark}) {
    sharedPreferencesUtils.setTheme("dark", isDark);
    emit(ChangeThemeState(isDark: isDark));
  }

  void changeCountry({required String country}) {
    sharedPreferencesUtils.setCountry("country", country);
    emit(ChangeCountryState(country: country));
  }

  void changeLanguage({required String language}) {
    sharedPreferencesUtils.setCountry("language", language);
    emit(ChangeLanguageState(language: language));
  }
}
