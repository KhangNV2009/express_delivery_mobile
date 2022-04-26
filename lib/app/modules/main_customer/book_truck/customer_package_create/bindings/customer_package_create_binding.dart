import 'package:get/get.dart';

import '../controllers/customer_package_create_controller.dart';

class CustomerPackageCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerPackageCreateController>(
      () => CustomerPackageCreateController(),
    );
  }
}
