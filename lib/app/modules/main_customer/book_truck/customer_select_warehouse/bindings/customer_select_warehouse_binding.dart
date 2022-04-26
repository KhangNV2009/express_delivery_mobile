import 'package:get/get.dart';

import '../controllers/customer_select_warehouse_controller.dart';

class CustomerSelectWarehouseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerSelectWarehouseController>(
      () => CustomerSelectWarehouseController(),
    );
  }
}
