import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class AppTheme extends ChangeNotifier {
  static const _key = 'is_dark_mode';
  late ThemeData _darkTheme, _lightTheme;
  final SharedPreferences _sharedPreference;

  AppTheme(this._sharedPreference);

  // getters:-------------------------------------------------------------------
  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;
  bool get isDarkMode => _sharedPreference.getBool(_key) ?? false;

  // #region Genral Methods [Theme]
  // Load theme configurations
  Future<void> initialize() async {
    _darkTheme = ThemeDecoder.decodeThemeData(
        json.decode(await rootBundle.loadString(AppConst.darkTheme)))!;
    _lightTheme = ThemeDecoder.decodeThemeData(
        json.decode(await rootBundle.loadString(AppConst.lightTheme)))!;
  }

  bool isPlatformDark(BuildContext context) =>
      MediaQuery.platformBrightnessOf(context) == Brightness.dark;

  Future<void> changeThemeMode({required bool isDark}) async {
    _sharedPreference.setBool(_key, isDark);
    notifyListeners();
  }
  // #endregion

}
