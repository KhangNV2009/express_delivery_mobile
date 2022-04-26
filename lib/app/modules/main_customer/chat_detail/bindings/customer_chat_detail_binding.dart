import 'package:get/get.dart';

import '../controllers/customer_chat_detail_controller.dart';

class CustomerChatDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerChatDetailController>(
      () => CustomerChatDetailController(),
    );
  }
}
