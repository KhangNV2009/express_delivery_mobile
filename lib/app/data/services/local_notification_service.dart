import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  /// constructor
  static final LocalNotificationService _instance = LocalNotificationService._internal();

  LocalNotificationService._internal();

  factory LocalNotificationService() {
    return _instance;
  }

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  static const initializationSettingsIOS = IOSInitializationSettings(
    onDidReceiveLocalNotification: onDidReceiveLocalNotification,
  );

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  Future<void> init() async {
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );
  }

  static void onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async {
    // showDialog(
    //   context: Get.context!,
    //   builder: (BuildContext context) => CupertinoAlertDialog(
    //     title: Text(title ?? ''),
    //     content: Text(body ?? ''),
    //     actions: [
    //       CupertinoDialogAction(
    //         isDefaultAction: true,
    //         child: Text('Ok'),
    //         onPressed: () async {
    //           Navigator.of(context, rootNavigator: true).pop();
    //           await Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => SecondScreen(payload),
    //             ),
    //           );
    //         },
    //       )
    //     ],
    //   ),
    // );
  }

  void onSelectNotification(String? payload) {}

  Future<void> showHistoryNotification({
    required String title,
    required String body,
  }) async {
    const androidChannel = AndroidNotificationDetails(
      'history_channel_id',
      'history_channel_name',
      channelDescription: 'History channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const iOSChannel = IOSNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const platformChannelSpecifics = NotificationDetails(
      android: androidChannel,
      iOS: iOSChannel,
    );
    await LocalNotificationService()
        .flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics);
  }

  Future<void> showIncidentNotification({
    required String title,
    required String body,
  }) async {
    const androidChannel = AndroidNotificationDetails(
      'incident_channel_id',
      'incident_channel_name',
      channelDescription: 'Incident channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const iOSChannel = IOSNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const platformChannelSpecifics = NotificationDetails(
      android: androidChannel,
      iOS: iOSChannel,
    );
    await LocalNotificationService()
        .flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics);
  }

  Future<void> showChatNotification({
    required String title,
    required String body,
  }) async {
    const androidChannel = AndroidNotificationDetails(
      'chat_channel_id',
      'chat_channel_name',
      channelDescription: 'Chat channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const iOSChannel = IOSNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const platformChannelSpecifics = NotificationDetails(
      android: androidChannel,
      iOS: iOSChannel,
    );
    await LocalNotificationService()
        .flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics);
  }
}
