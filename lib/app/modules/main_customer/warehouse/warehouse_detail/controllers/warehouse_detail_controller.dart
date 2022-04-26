import 'dart:convert';

import 'package:express_delivery/app/data/models/package/package_response.dart';
import 'package:express_delivery/app/data/models/warehouse/warehouse_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/package_constants.dart';
import '../../../../../data/models/package/package_model.dart';
import '../../../../../data/repositories/package_remote_repository.dart';
import '../../../../../data/repositories/warehouse_remote_repository.dart';
import '../../../../../utils/snack_bar_utils.dart';

class WarehouseDetailController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  late PageController pageController;
  int currentTabIndex = 0;
  bool shouldHandlePageChanged = true;
  final warehouse = WarehouseModel().obs;
  late int warehouseId = 0;

  /// services
  final warehouseRemoteRepository = WarehouseRemoteRepository();
  final packageRemoteRepository = PackageRemoteRepository();

  /// packages
  final packagesWait = <PackageModel>[].obs;
  final packagesConfirmed = <PackageModel>[].obs;
  final packagesInTransit = <PackageModel>[].obs;
  final packagesShipSuccess = <PackageModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this);
    pageController = PageController(initialPage: currentTabIndex);

    final Map<String, String?>? _parameters = Get.parameters;
    warehouseId = jsonDecode(_parameters?['warehouse_id'] ?? '');
  }

  @override
  void onReady() {
    super.onReady();
    getWarehouseDetail(warehouseId);
    getPackagesWaitConfirm();
    getPackagesConfirmed();
    getPackagesInTransit();
    getPackagesShipSuccess();
  }

  @override
  void onClose() {}

  void getWarehouseDetail(int id) async {
    final response = await warehouseRemoteRepository.getWarehouseDetail(id: id);
    if (response.statusCode == 200) {
      if (response.data != null) {
        warehouse.value = response.data!;
      }
    } else {}
  }

  void getPackagesWaitConfirm() {
    _getPackages(
      state: PackageConstants.waitConfirm,
      packages: (packages) {
        packagesWait.assignAll(packages ?? []);
      },
    );
  }

  void getPackagesConfirmed() {
    _getPackages(
      state: PackageConstants.confirmed,
      packages: (packages) {
        packagesConfirmed.assignAll(packages ?? []);
      },
    );
  }

  void getPackagesInTransit() {
    _getPackages(
      state: PackageConstants.inTransit,
      packages: (packages) {
        packagesInTransit.assignAll(packages ?? []);
      },
    );
  }

  void getPackagesShipSuccess() {
    _getPackages(
      state: PackageConstants.shipSuccess,
      packages: (packages) {
        packagesShipSuccess.assignAll(packages ?? []);
      },
    );
  }

  void _getPackages({
    required int state,
    required Function(List<PackageModel>?) packages,
  }) async {
    PackageResponse response = await packageRemoteRepository.getPackages(
      state: state,
      warehouseId: warehouseId,
    );
    if (response.success) {
      packages(response.data);
    } else {
      SnackBarUtils().showErrorSnackBar('get packages failed');
    }
  }
}
