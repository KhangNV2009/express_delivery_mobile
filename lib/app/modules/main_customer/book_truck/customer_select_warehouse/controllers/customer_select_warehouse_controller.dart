import 'package:get/get.dart';

import '../../../../../data/models/warehouse/warehouse_model.dart';
import '../../../../../data/repositories/warehouse_remote_repository.dart';
import '../../controllers/book_truck_controller.dart';

class CustomerSelectWarehouseController extends GetxController {
  final warehouseService = WarehouseRemoteRepository();
  final warehouses = <WarehouseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getWarehouseList();
  }

  @override
  void onClose() {}

  void getWarehouseList() async {
    final response = await warehouseService.getWarehouses();
    if (response.success) {
      if (response.data != null) {
        warehouses.assignAll(response.data ?? []);
      }
    } else {}
  }

  void onTapWarehouse({
    required int warehouseId,
  }) {
    final BookTruckController _bookTruckController = Get.put(BookTruckController());
    _bookTruckController.warehouseId = warehouseId;
    _bookTruckController.markSelected(0);
    Get.back();
  }
}
