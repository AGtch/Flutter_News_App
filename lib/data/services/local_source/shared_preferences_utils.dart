import 'package:flutter_news/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  // call this method from iniState() function of mainApp().

  Future<bool> setTheme(String key, bool themeIsDark) async =>
      await getIt.get<SharedPreferences>().setBool(key, themeIsDark);

  bool? getTheme(String key) => getIt.get<SharedPreferences>().getBool(key);

  Future<bool> setCountry(String key, String country) async =>
      await getIt.get<SharedPreferences>().setString(key, country);

  String? getCountry(String key) =>
      getIt.get<SharedPreferences>().getString(key);

  Future<bool> setLanguage(String key, String country) async =>
      await getIt.get<SharedPreferences>().setString(key, country);

  String? getLanguage(String key) =>
      getIt.get<SharedPreferences>().getString(key);
}
