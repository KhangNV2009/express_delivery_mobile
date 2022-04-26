import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/dialogs/custom_dialogs.dart';
import '../../../../../data/models/core/base_response.dart';
import '../../../../../data/models/location/location_model.dart';
import '../../../../../data/models/warehouse/warehouse_create_request.dart';
import '../../../../../data/models/warehouse/warehouse_model.dart';
import '../../../../../data/repositories/warehouse_remote_repository.dart';
import '../../../../../routes/app_pages.dart';
import '../../controllers/warehouse_controller.dart';

class WarehouseEditController extends GetxController {
  late WarehouseModel? warehouseModel;

  final address = ''.obs;
  late LocationModel locationModel;
  String? warehouseName;
  final TextEditingController warehouseNameController = TextEditingController();
  final enableButton = false.obs;

  final warehouseRemoteRepository = WarehouseRemoteRepository();

  @override
  void onInit() {
    super.onInit();
    final Map<String, String?>? _parameters = Get.parameters;
    final warehouseJson = jsonDecode(_parameters?['warehouse_model'] ?? '');
    warehouseModel = WarehouseModel.fromJson(warehouseJson);
    ever(address, (_) {
      validateButton();
    });
  }

  @override
  void onReady() {
    super.onReady();
    warehouseNameController.text = warehouseModel?.name ?? '';
    address.value = '${warehouseModel?.location?.street} '
        '${warehouseModel?.location?.district}, '
        '${warehouseModel?.location?.city}';
    locationModel = warehouseModel?.location ?? LocationModel();
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

  void editWarehouse() async {
    final request = WarehouseCreateRequest(
      name: warehouseNameController.text,
      lat: locationModel.lat,
      lng: locationModel.lng,
      street: locationModel.street,
      ward: locationModel.ward,
      district: locationModel.district,
      city: locationModel.city,
    );
    BaseResponse response = await warehouseRemoteRepository.editWarehouse(
      id: warehouseModel?.id ?? 0,
      request: request,
    );
    if (response.success) {
      Get.until((route) => route.settings.name == Routes.WAREHOUSE);
      final _warehouseController = Get.find<WarehouseController>();
      _warehouseController.getWarehouseList();
    } else {}
  }

  void deleteWarehouse() {
    CustomDialogs().confirmRemoveGroupDialog(
      onCancelTap: () {
        Get.back();
      },
      onConfirmTap: () async {
        BaseResponse response = await warehouseRemoteRepository.removeWarehouse(
          id: warehouseModel?.id ?? 0,
        );
        if (response.success) {
          Get.until((route) => route.settings.name == Routes.WAREHOUSE);
          final _warehouseController = Get.find<WarehouseController>();
          _warehouseController.getWarehouseList();
        } else {}
      },
    );
  }
}
