import 'package:get/get.dart';

import '../controllers/customer_setting_controller.dart';

class CustomerSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerSettingController>(
      () => CustomerSettingController(),
    );
  }
}
