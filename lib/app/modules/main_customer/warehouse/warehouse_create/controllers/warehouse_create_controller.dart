import 'package:express_delivery/app/data/models/core/base_response.dart';
import 'package:express_delivery/app/data/repositories/warehouse_remote_repository.dart';
import 'package:express_delivery/app/utils/snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/models/location/location_model.dart';
import '../../../../../data/models/warehouse/warehouse_create_request.dart';
import '../../controllers/warehouse_controller.dart';

class WarehouseCreateController extends GetxController {
  final address = ''.obs;
  late LocationModel locationModel;
  String? warehouseName;
  final TextEditingController warehouseNameController = TextEditingController();
  final enableButton = false.obs;

  final warehouseRemoteRepository = WarehouseRemoteRepository();

  @override
  void onInit() {
    super.onInit();
    ever(address, (_) {
      validateButton();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onWarehouseNameChanged(String value) {
    warehouseName = value;
    validateButton();
  }

  void validateButton() {
    enableButton.value = warehouseNameController.text.isNotEmpty && address.value.isNotEmpty;
  }

  void createWarehouse() async {
    final request = WarehouseCreateRequest(
      name: warehouseNameController.text,
      lat: locationModel.lat,
      lng: locationModel.lng,
      street: locationModel.street,
      ward: locationModel.ward,
      district: locationModel.district,
      city: locationModel.city,
    );
    BaseResponse response = await warehouseRemoteRepository.createWarehouse(request: request);
    if (response.success) {
      final _warehouseController = Get.put(WarehouseController());
      _warehouseController.getWarehouseList();
      Get.back();
      SnackBarUtils().showMessageSnackBar('Create warehouse successfully');
    } else {
      SnackBarUtils().showErrorSnackBar('Create warehouse failed');
    }
  }
}
