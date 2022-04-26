import 'package:get/get.dart';

import '../controllers/customer_account_info_controller.dart';

class CustomerAccountInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerAccountInfoController>(
      () => CustomerAccountInfoController(),
    );
  }
}
