import 'package:get/get.dart';

import '../controllers/main_driver_controller.dart';

class MainDriverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainDriverController>(
      () => MainDriverController(),
    );
  }
}
