import 'dart:convert';

import 'package:express_delivery/app/data/models/core/base_response.dart';
import 'package:express_delivery/app/data/models/package/package_create_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/models/package/package_model.dart';
import '../../../../../data/repositories/package_remote_repository.dart';
import '../../../../../utils/snack_bar_utils.dart';
import '../../controllers/book_truck_controller.dart';

class CustomerPackageCreateController extends GetxController {
  final packageModel = Rxn<PackageModel>();
  int? warehouseId;

  final nameController = TextEditingController();
  final weightController = TextEditingController();
  final categoryController = TextEditingController();

  final enableButton = false.obs;

  /// services
  final packageRemoteRepository = PackageRemoteRepository();

  @override
  void onInit() {
    super.onInit();
    final Map<String, String?>? _parameters = Get.parameters;
    final packageJson = jsonDecode(_parameters?['package_model'] ?? '');
    warehouseId = jsonDecode(_parameters?['warehouse_id'] ?? '');
    if (packageJson != null) {
      packageModel.value = PackageModel.fromJson(packageJson);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void initPackageInfo() {
    nameController.text = packageModel.value?.name ?? '';
    weightController.text = '${packageModel.value?.weight ?? 0.0}';
    categoryController.text = packageModel.value?.category ?? '';
  }

  void onNameChanged(String value) {
    validateButton();
  }

  void onWeightChanged(String value) {
    validateButton();
  }

  void onCategoryChanged(String value) {
    validateButton();
  }

  void validateButton() {
    enableButton.value = nameController.text.isNotEmpty &&
        weightController.text.isNotEmpty &&
        categoryController.text.isNotEmpty;
  }

  void createPackage() async {
    PackageCreateResponse response = await packageRemoteRepository.createPackage(
      name: nameController.text,
      weight: double.parse(weightController.text),
      category: categoryController.text,
      warehouseId: warehouseId ?? 0,
    );
    if (response.success) {
      final _bookTruckController = Get.put(BookTruckController());
      if (response.data != null) {
        _bookTruckController.packageModel = response.data!;
        _bookTruckController.markSelected(2);
      }
      Get.back();
      SnackBarUtils().showMessageSnackBar('Create package successfully');
    } else {
      SnackBarUtils().showErrorSnackBar('You need select warehouse first');
    }
  }
}
