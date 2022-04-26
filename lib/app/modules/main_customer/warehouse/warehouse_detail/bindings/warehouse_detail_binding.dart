import 'package:get/get.dart';

import '../controllers/warehouse_detail_controller.dart';

class WarehouseDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WarehouseDetailController>(
      () => WarehouseDetailController(),
    );
  }
}
