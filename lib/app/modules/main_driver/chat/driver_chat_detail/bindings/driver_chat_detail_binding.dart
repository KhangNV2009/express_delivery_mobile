import 'package:get/get.dart';

import '../controllers/driver_chat_detail_controller.dart';

class DriverChatDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverChatDetailController>(
      () => DriverChatDetailController(),
    );
  }
}
