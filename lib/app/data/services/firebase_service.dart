import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../../utils/logger_service.dart';

class FirebaseService {
  final messageType = "messageType";
  final iconNotification = "ic_notification_default";

  static final FirebaseService singleton = FirebaseService._internal();

  factory FirebaseService() {
    return singleton;
  }

  FirebaseService._internal() {
    _initTokenRefresh();
  }

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  String? _tokenString;

  String? get tokenString => _tokenString;

  Future<String?> initToken() async {
    _tokenString = await firebaseMessaging.getToken();
    LoggerService.log.i('Token init: $_tokenString');
    return _tokenString;
  }

  void _initTokenRefresh() {
    firebaseMessaging.onTokenRefresh.listen((token) {
      _tokenString = token;
      LoggerService.log.i('onTokenRefresh: $token');
    });
  }

  Future deleteToken() async {
    await firebaseMessaging.setAutoInitEnabled(false);
    await firebaseMessaging.deleteToken();
    await firebaseMessaging.setAutoInitEnabled(true);
  }
}