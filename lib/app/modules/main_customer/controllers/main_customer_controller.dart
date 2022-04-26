import 'package:express_delivery/app/data/models/history/history_response.dart';
import 'package:express_delivery/app/data/models/session/session_response.dart';
import 'package:express_delivery/app/data/services/loading_dialog_service.dart';
import 'package:express_delivery/app/modules/main_customer/views/home_customer_widget.dart';
import 'package:express_delivery/app/modules/main_customer/views/notification_customer_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../constants/app_constants.dart';
import '../../../data/models/core/base_response.dart';
import '../../../data/models/history/history_model.dart';
import '../../../data/models/session/session_model.dart';
import '../../../data/models/user/user_model.dart';
import '../../../data/models/user/user_response.dart';
import '../../../data/repositories/auth_remote_repository.dart';
import '../../../data/repositories/history_remote_repository.dart';
import '../../../data/repositories/incident_remote_repository.dart';
import '../../../data/repositories/session_remote_repository.dart';
import '../../../data/services/local_notification_service.dart';
import '../../../data/storage/core_storage_manager.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/logger_service.dart';
import '../../../utils/snack_bar_utils.dart';
import '../views/chat_customer_widget.dart';
import '../views/more_customer_widget.dart';

class MainCustomerController extends GetxController with GetSingleTickerProviderStateMixin {
  final Rxn<UserModel> userModel = Rxn<UserModel>();
  final version = ''.obs;

  /// services
  final authRemoteRepository = AuthRemoteRepository();
  final historyRemoteRepository = HistoryRemoteRepository();
  final incidentRemoteRepository = IncidentRemoteRepository();
  final sessionRemoteRepository = SessionRemoteRepository();

  /// socket
  IO.Socket socket = IO.io(
    'http://192.168.0.105:3000',
    IO.OptionBuilder().setTransports(['websocket']).build(),
  );

  DateTime? clickedLastTime;
  var tabIndex = 0.obs;
  final List<Widget> listScreens = [
    HomeCustomerWidget(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  /// notifications
  late TabController tabController;
  late PageController pageController;
  int currentTabIndex = 0;
  bool shouldHandlePageChanged = true;

  final histories = RxList<HistoryModel>();
  final incidents = RxList<HistoryModel>();

  /// chat
  final sessions = RxList<SessionModel>();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    pageController = PageController(initialPage: currentTabIndex);
    userModel.value = CoreStorageManager().getUser();
  }

  @override
  void onReady() {
    super.onReady();
    initSocketClient();
    socketClientListener();
    initFCMListener();
    getHistories();
    getIncidents();
    getSessions();
  }

  @override
  void onClose() {
    socket.dispose();
    socket.close();
  }

  void initFCMListener() {
    if (CoreStorageManager().getRole() == 1) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        final String type = (message.data['type']).toString();
        final title = message.notification?.title ?? '';
        final body = message.notification?.body ?? '';
        switch (type) {
          case AppConstants.HISTORY_TYPE:
            await LocalNotificationService().showHistoryNotification(
              title: title,
              body: body,
            );
            getHistories();
            break;
          case AppConstants.INCIDENT_TYPE:
            await LocalNotificationService().showIncidentNotification(
              title: title,
              body: body,
            );
            getIncidents();
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
      });
    }
  }

  void onPageChange(int index) {
    tabIndex.value = index;
  }

  void changeTabIndex(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        if (listScreens[index] is ChatCustomerWidget) {
        } else {
          listScreens[index] = ChatCustomerWidget();
        }
        break;
      case 2:
        if (listScreens[index] is NotificationCustomerWidget) {
        } else {
          listScreens[index] = NotificationCustomerWidget();
        }
        break;
      case 3:
        if (listScreens[index] is MoreCustomerWidget) {
        } else {
          listScreens[index] = MoreCustomerWidget();
        }
        break;
    }
    tabIndex.value = index;
  }

  void initSocketClient() {
    socket.connect();
  }

  void socketClientListener() {
    socket.onConnect((_) {
      LoggerService.log.w('socket is connected');
      socket.emit('message', 'test');
    });
    socket.on('message', (data) => LoggerService.log.w(data));
    socket.onDisconnect((_) => LoggerService.log.w('socket is disconnected'));
    socket.onConnectError((error) => LoggerService.log.w('Connect socket error: $error'));
    socket.onError((data) => LoggerService.log.w('onError: $data'));
  }

  void getVersionInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version.value = packageInfo.version;
  }

  void getHistories() async {
    HistoryResponse response = await historyRemoteRepository.getHistory();
    if (response.success) {
      histories.assignAll(response.data?.toList() ?? []);
    } else {
      SnackBarUtils().showErrorSnackBar('Loading history failed');
    }
  }

  void getIncidents() async {
    HistoryResponse response = await incidentRemoteRepository.getIncidents();
    if (response.success) {
      incidents.assignAll(response.data?.toList() ?? []);
    } else {
      SnackBarUtils().showErrorSnackBar('Loading incidents failed');
    }
  }

  void getSessions() async {
    SessionResponse response = await sessionRemoteRepository.getCustomerSession();
    if (response.success) {
      response.data?.forEach((session) async {
        session.driver = await getCustomerInfo(userId: session.customerId ?? 0);
        sessions.add(session);
      });
    } else {
      SnackBarUtils().showErrorSnackBar('Loading session failed');
    }
  }

  Future<UserModel?> getCustomerInfo({
    required int userId,
  }) async {
    UserResponse response = await authRemoteRepository.getUserInfo(userId: userId);
    if(response.success) {
      return response.data;
    } else {
      return null;
    }
  }

  void logout() async {
    LoadingDialogUtils().loadingOverlayVisible(visible: true);
    BaseResponse response = await authRemoteRepository.logout();
    LoadingDialogUtils().loadingOverlayVisible(visible: false);
    if (response.success) {
      CoreStorageManager().setUser(null);
      CoreStorageManager().setRefreshToken(null);
      CoreStorageManager().setAccessToken(null);
      CoreStorageManager().setRole(0);
      Get.offAllNamed(Routes.LOGIN);
    } else {
      SnackBarUtils().showErrorSnackBar('Logout fail');
    }
  }
}
