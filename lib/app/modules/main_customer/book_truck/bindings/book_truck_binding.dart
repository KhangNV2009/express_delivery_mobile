import 'package:get/get.dart';

import '../controllers/book_truck_controller.dart';

class BookTruckBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookTruckController>(
      () => BookTruckController(),
    );
  }
}
