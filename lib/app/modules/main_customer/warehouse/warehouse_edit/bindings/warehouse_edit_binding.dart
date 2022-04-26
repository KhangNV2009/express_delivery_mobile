import 'package:get/get.dart';

import '../controllers/warehouse_edit_controller.dart';

class WarehouseEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WarehouseEditController>(
      () => WarehouseEditController(),
    );
  }
}
