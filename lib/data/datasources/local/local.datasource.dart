import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/config/app.service.dart';
import 'package:invoice_tracking_flutter/data/entities/user.entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localDataSourceProvider = Provider<LocalDataSource>((ref) =>
    LocalDataSource(ref.read(sharedPreferencesProvider).asData!.value));

class LocalDataSource {
  static const _tokenKey = 'auth_token';
  static const _onBoard = 'on_board';
  static const _isSignedInKey = 'is_signed_in';
  static const _userKey = 'user';
  static const _deviceToken = 'device_token';

  final SharedPreferences _sharedPreference;

  LocalDataSource(this._sharedPreference);

  // getters:-------------------------------------------------------------------
  bool get isSignedIn => _sharedPreference.getBool(_isSignedInKey) ?? false;
  bool get showOnBoard => _sharedPreference.getBool(_onBoard) ?? false;
  String get authToken => _sharedPreference.getString(_tokenKey) ?? '';
  String get deviceToken => _sharedPreference.getString(_deviceToken) ?? '';
  UserEntity get user => UserEntity.fromJson(
      json.decode(_sharedPreference.getString(_userKey) ?? '{}'));

  // #region Genral Methods [auth]
  /// Store token in device storage
  Future<void> storeAuthToken({required String authToken}) async {
    _sharedPreference.setString(_tokenKey, authToken);
  }

  /// Store token in device storage
  Future<void> storeDeviceToken({required String deviceToken}) async {
    _sharedPreference.setString(_deviceToken, deviceToken);
  }

  /// Store signed in state in device storage
  Future<void> storeSignedInState({required bool isSignedIn}) async {
    _sharedPreference.setBool(_isSignedInKey, isSignedIn);
  }

  /// Store first time opened state in device storage
  Future<void> storeOnBoardState({required bool showOnBoard}) async {
    _sharedPreference.setBool(_onBoard, showOnBoard);
  }

  /// Store first time opened state in device storage
  Future<void> storeUser({required String user}) async {
    _sharedPreference.setString(_userKey, user);
  }

  /// Remove token from device storage and set isSignedIn to flase
  Future<bool> clear() async {
    return _sharedPreference.clear();
  }
  // #endregion

}
