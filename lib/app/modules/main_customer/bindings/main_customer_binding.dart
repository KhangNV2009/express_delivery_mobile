import 'package:get/get.dart';

import '../controllers/main_customer_controller.dart';

class MainCustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainCustomerController>(
      () => MainCustomerController(),
    );
  }
}
