import 'package:express_delivery/app/data/models/deliveries/delivery_response.dart';
import 'package:express_delivery/app/data/models/user/user_response.dart';
import 'package:express_delivery/app/data/repositories/delivery_remote_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../constants/package_constants.dart';
import '../../../data/models/core/base_response.dart';
import '../../../data/models/deliveries/delivery_model.dart';
import '../../../data/models/session/session_model.dart';
import '../../../data/models/session/session_response.dart';
import '../../../data/models/user/user_model.dart';
import '../../../data/repositories/auth_remote_repository.dart';
import '../../../data/repositories/session_remote_repository.dart';
import '../../../data/services/loading_dialog_service.dart';
import '../../../data/storage/core_storage_manager.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/logger_service.dart';
import '../../../utils/snack_bar_utils.dart';
import '../views/chat_driver_widget.dart';
import '../views/delivery_driver_widget.dart';
import '../views/profile_driver_widget.dart';

class MainDriverController extends GetxController with GetSingleTickerProviderStateMixin {
  /// bottom navigation bar
  DateTime? clickedLastTime;
  var tabIndex = 0.obs;
  final List<Widget> listScreens = [
    DeliveryDriverWidget(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  /// deliveries
  late TabController tabController;
  late PageController pageController;
  int currentTabIndex = 0;
  bool shouldHandlePageChanged = true;

  final unconfirmedDeliveries = <DeliveryModel>[].obs;
  final confirmedDeliveries = <DeliveryModel>[].obs;
  final inTransitDeliveries = <DeliveryModel>[].obs;

  /// chats
  final sessions = RxList<SessionModel>();

  /// services
  final deliveryRemoteRepository = DeliveryRemoteRepository();
  final authRemoteRepository = AuthRemoteRepository();
  final sessionRemoteRepository = SessionRemoteRepository();

  /// socket
  IO.Socket socket = IO.io(
    'http://192.168.0.105:3000',
    IO.OptionBuilder().setTransports(['websocket']).build(),
  );

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    pageController = PageController(initialPage: currentTabIndex);
  }

  @override
  void onReady() {
    super.onReady();
    initSocketClient();
    socketClientListener();
    getDeliveriesUnconfirmed();
    getDeliveriesUnconfirmed();
    getDeliveriesConfirmed();
    getSessions();
  }

  @override
  void onClose() {}

  void changeTabIndex(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        if (listScreens[index] is ChatDriverWidget) {
        } else {
          listScreens[index] = ChatDriverWidget();
        }
        break;
      case 2:
        if (listScreens[index] is ProfileDriverWidget) {
        } else {
          listScreens[index] = ProfileDriverWidget();
        }
        break;
    }
    tabIndex.value = index;
  }

  void getDeliveriesUnconfirmed() {
    _getDeliveries(
      state: PackageConstants.waitConfirm,
      deliveries: (deliveries) {
        unconfirmedDeliveries.assignAll(deliveries ?? []);
      },
    );
  }

  void getDeliveriesConfirmed() {
    _getConfirmedDeliveries(
      state: PackageConstants.confirmed,
      deliveries: (deliveries) {
        confirmedDeliveries.assignAll(deliveries ?? []);
      },
    );
  }

  void getDeliveriesInTransit() {
    _getConfirmedDeliveries(
      state: PackageConstants.inTransit,
      deliveries: (deliveries) {
        inTransitDeliveries.assignAll(deliveries ?? []);
      },
    );
  }

  void _getDeliveries({
    required int state,
    required Function(List<DeliveryModel>?) deliveries,
  }) async {
    DeliveryResponse response = await deliveryRemoteRepository.getDeliveries(state: state);
    if (response.success) {
      deliveries(response.data);
    } else {
      SnackBarUtils().showMessageSnackBar('Loading delivery failed');
    }
  }

  void _getConfirmedDeliveries({
    required int state,
    required Function(List<DeliveryModel>?) deliveries,
  }) async {
    DeliveryResponse response = await deliveryRemoteRepository.getConfirmedDeliveries(state: state);
    if (response.success) {
      deliveries(response.data);
    } else {
      SnackBarUtils().showMessageSnackBar('Loading delivery failed');
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

  void getSessions() async {
    SessionResponse response = await sessionRemoteRepository.getDriverSession();
    if (response.success) {
      response.data?.forEach((session) async {
        session.customer = await getCustomerInfo(userId: session.customerId ?? 0);
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
}
