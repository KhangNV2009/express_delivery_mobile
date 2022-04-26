import 'package:get/get.dart';

import '../controllers/driver_create_report_controller.dart';

class DriverCreateReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverCreateReportController>(
      () => DriverCreateReportController(),
    );
  }
}
