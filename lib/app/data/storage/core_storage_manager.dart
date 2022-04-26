import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../utils/app_strings.dart';
import '../../utils/logger_service.dart';
import '../models/user/user_model.dart';

class CoreStorageManager {
  static const _appKeys = 'express_delivery';

  /// Tokens
  static const _accessToken = '${_appKeys}_accessToken';
  static const _refreshToken = '${_appKeys}_refreshToken';
  static const _language = '${_appKeys}_language';

  /// role
  static const _role = '${_appKeys}_role';

  /// is Logged
  static const _isLogged = '${_appKeys}_isLogged';

  /// user
  static const _user = '${_appKeys}_user';

  ///Constructors
  static final CoreStorageManager _instance = CoreStorageManager._internal();

  CoreStorageManager._internal();

  factory CoreStorageManager() {
    return _instance;
  }

  ///Storage box
  static final storageBox = GetStorage();

  ///Initiate Get Storage
  Future<void> initGetStorage() async {
    LoggerService.log.v('Initializing Get Storage...');
    await GetStorage.init();
    LoggerService.log.v('Get Storage initialized!');
  }

  /// tokens
  void setAccessToken(String? token) {
    LoggerService.log.i('Setting access token: $token');
    final storedToken = ReadWriteValue(_accessToken, '');
    if (token == null) {
      LoggerService.log.e('Token is null, setting empty value');
    }
    storedToken.val = token ?? '';
  }

  String getAccessToken() {
    final token = ReadWriteValue(_accessToken, '').val;
    LoggerService.log.i('Token: $token');
    return token;
  }

  void setRefreshToken(String? token) {
    LoggerService.log.i('Setting refresh token: $token');
    final storedToken = ReadWriteValue(_refreshToken, '');
    if (token == null) {
      LoggerService.log.e('Token is null, setting empty value');
    }
    storedToken.val = token ?? '';
  }

  String getRefreshToken() {
    final token = ReadWriteValue(_refreshToken, '').val;
    LoggerService.log.i('Refresh token: $token');
    return token;
  }

  /// language
  String getLanguage() {
    final localeString = ReadWriteValue(_language, Strings.ENGLISH).val;
    return localeString;
  }

  void setLanguage(String language) {
    final storeThemeMode = ReadWriteValue(_language, Strings.ENGLISH);
    storeThemeMode.val = language;
  }

  /// is logged
  bool getIsLogged() {
    final isLogged = ReadWriteValue(_isLogged, false).val;
    return isLogged;
  }

  void setIsLogged(bool isLogged) {
    final storeIsLogged = ReadWriteValue(_isLogged, false);
    storeIsLogged.val = isLogged;
  }

  /// role
  int getRole() {
    final role = ReadWriteValue(_role, 0).val;
    return role;
  }

  void setRole(int role) {
    final storeRole = ReadWriteValue(_role, 0);
    storeRole.val = role;
  }

  /// user
  void setUser(UserModel? user) {
    final storedToken = ReadWriteValue(_user, '');
    if (user == null) {
      LoggerService.log.e('User is null, setting empty value');
      storedToken.val = '';
    } else {
      storedToken.val = json.encode(user.toJson());
    }
  }

  UserModel? getUser() {
    final userString = ReadWriteValue(_user, '').val;
    if (userString.isEmpty) {
      return null;
    } else {
      final userJson = json.decode(userString);
      final user = UserModel.fromJson(userJson);
      return user;
    }
  }
}
