import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/models/chat/chat_model.dart';
import '../../../../../data/models/chat/chat_response.dart';
import '../../../../../data/repositories/chat_remote_repository.dart';
import '../../../../../data/storage/core_storage_manager.dart';
import '../../../../../utils/logger_service.dart';
import '../../../../../utils/snack_bar_utils.dart';
import '../../../controllers/main_driver_controller.dart';

class DriverChatDetailController extends GetxController {
  final chats = <ChatModel>[].obs;

  /// message
  int? currentUserId;
  final scrollController = ScrollController();
  final messageController = TextEditingController();
  int? sessionId;
  String? customerName;
  String? customerAvatar;

  /// services
  final chatRemoteRepository = ChatRemoteRepository();

  @override
  void onInit() async {
    super.onInit();
    final _parameters = Get.parameters;
    currentUserId = CoreStorageManager().getUser()?.id;
    sessionId = jsonDecode(_parameters['session_id'] ?? '');
    customerName = jsonDecode(_parameters['customer_name'] ?? '');
    customerAvatar = jsonDecode(_parameters['customer_avatar'] ?? '');

    ever(chats, (_) async {
      await Future.delayed(Duration.zero, () {
        scrollController.animateTo(
          scrollController.position.minScrollExtent,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInCubic,
        );
      });
    });
  }

  @override
  void onReady() async {
    super.onReady();
    getChatDetail();
    initSocketListener();
  }

  @override
  void onClose() {
    scrollController.dispose();
  }

  void onMessageChanged(String value) {}

  void onSendMessage() {
    if (messageController.text.isNotEmpty) {
      final MainDriverController _mainController = Get.put(MainDriverController());
      _mainController.socket.emit('text', [
        ChatModel(
          userId: currentUserId,
          sessionId: sessionId,
          text: messageController.text,
        ),
      ]);
      messageController.clear();
    }
  }

  double initialShowCaseView(GlobalKey key) {
    RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    LoggerService.log.w(position.dx);
    return position.dy;
  }

  void getChatDetail() async {
    ChatResponse response = await chatRemoteRepository.getChatDetail(
      sessionId: sessionId ?? 0,
      limit: 30,
      page: 1,
    );
    if (response.success) {
      chats.assignAll(response.data?.rows ?? []);
    } else {
      SnackBarUtils().showErrorSnackBar('Loading chat detail failed');
    }
  }

  void initSocketListener() {
    final MainDriverController _mainController = Get.put(MainDriverController());
    _mainController.socket.on('text', (data) {
      final chatModel = ChatModel.fromJson(data);
      chats.add(chatModel);
      chats.refresh();
    });
  }
}
