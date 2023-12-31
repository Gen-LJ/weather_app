import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../../../common/const/key_const.dart";


final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedUtility>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedUtility(sharedPreferences: sharedPrefs);
});

class SharedUtility {
  SharedUtility({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  bool isDarkModeEnabled() {
    return sharedPreferences.getBool(sharedDarkModeKey) ?? false;
  }

  void setDarkModeEnabled({required bool isdark}) {
    sharedPreferences.setBool(sharedDarkModeKey, isdark);
  }
}