import 'package:shared_preferences/shared_preferences.dart';

const _loggedInKey = "com.michaelhitzker.app_is_joke.loggedIn";

extension SharedPreferencesExtensions on SharedPreferences {
  bool get isLoggedIn {
    return getBool(_loggedInKey) ?? false;
  }

  set isLoggedIn(bool newValue) {
    setBool(_loggedInKey, newValue);
  }
}
