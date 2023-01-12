import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocale extends ChangeNotifier {
  static const _key = 'current_language';
  final SharedPreferences _sharedPreference;

  AppLocale(this._sharedPreference);

  // getters:-------------------------------------------------------------------
  String get currentLangauge => _sharedPreference.getString(_key) ?? 'en';

  // #region Genral Methods [Language]
  Future<void> changeCurrentLanguage({required String language}) async {
    _sharedPreference.setString(_key, language);
    notifyListeners();
  }

  // String? getLanguage() {
  //   return supportedLanguages[supportedLanguages
  //           .indexWhere((language) => language.locale == _locale)]
  //       .language;
  // }
  // #endregion

}
