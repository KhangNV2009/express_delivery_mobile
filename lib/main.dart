import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/constants/app_constants.dart';
import 'app/data/services/core_service.dart';
import 'app/data/services/language_service.dart';
import 'app/data/services/loading_dialog_service.dart';
import 'app/data/services/local_notification_service.dart';
import 'app/data/services/long_press_chat_service.dart';
import 'app/data/storage/core_storage_manager.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/translated_string.dart';

Future<void> main() async {
  await CoreStorageManager().initGetStorage();
  await initServices();
  await initializeDateFormatting();

  /// local notification
  await LocalNotificationService().init();

  /// firebase
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  /// refresh token
  await refreshToken();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: checkInitialRoute(),
      getPages: AppPages.routes,
      locale: LanguageService().language,
      translations: TranslatedString(),
      fallbackLocale: Locale('en', 'US'),
    ),
  );
}

Future<void> initServices() async {
  print('starting services ...');
  await Get.putAsync<CoreService>(() async => CoreService());

  ///Loading dialogs service
  await Get.putAsync<LoadingDialogService>(() async => LoadingDialogService());

  /// on long press dialog
  await Get.putAsync<LongPressChatService>(() async => LongPressChatService());
}

Future<void> refreshToken() async {
  if (CoreStorageManager().getRole() == 1 || CoreStorageManager().getRole() == 2) {
    if (await CoreService().requestRefreshToken()) {
    } else {
      CoreStorageManager().setRole(0);
    }
  }
}

String checkInitialRoute() {
  switch (CoreStorageManager().getRole()) {
    case 0:
      return AppPages.LOGIN;
    case 1:
      return AppPages.CUSTOMER;
    case 2:
      return AppPages.DRIVER;
    default:
      return AppPages.LOGIN;
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  final String type = (message.data['type']).toString();
  final title = message.notification?.title ?? '';
  final body = message.notification?.body ?? '';
  switch (type) {
    case AppConstants.HISTORY_TYPE:
      await LocalNotificationService().showHistoryNotification(
        title: title,
        body: body,
      );
      break;
    case AppConstants.INCIDENT_TYPE:
      await LocalNotificationService().showIncidentNotification(
        title: title,
        body: body,
      );
      break;
    case AppConstants.CHAT_TYPE:
      await LocalNotificationService().showChatNotification(
        title: title,
        body: body,
      );
      break;
    default:
      break;
  }
}
