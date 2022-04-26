import 'package:get/get.dart';

import '../controllers/warehouse_create_controller.dart';

class WarehouseCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WarehouseCreateController>(
      () => WarehouseCreateController(),
    );
  }
}
