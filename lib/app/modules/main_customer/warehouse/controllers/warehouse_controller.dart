import 'package:get/get.dart';

import '../../../../data/models/warehouse/warehouse_model.dart';
import '../../../../data/repositories/warehouse_remote_repository.dart';

class WarehouseController extends GetxController {
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
    if(response.success) {
      if(response.data != null) {
        warehouses.assignAll(response.data ?? []);
      }
    } else {

    }
  }
}
