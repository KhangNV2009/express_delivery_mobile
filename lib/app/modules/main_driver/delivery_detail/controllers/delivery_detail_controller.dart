import 'dart:convert';

import 'package:express_delivery/app/constants/package_constants.dart';
import 'package:express_delivery/app/data/services/loading_dialog_service.dart';
import 'package:get/get.dart';

import '../../../../data/models/core/base_response.dart';
import '../../../../data/models/deliveries/delivery_model.dart';
import '../../../../data/repositories/delivery_remote_repository.dart';
import '../../../../utils/snack_bar_utils.dart';
import '../../controllers/main_driver_controller.dart';

class DeliveryDetailController extends GetxController {
  final statusType = 0.obs;
  final deliveryModel = DeliveryModel().obs;

  /// services
  final deliveryRemoteRepository = DeliveryRemoteRepository();

  @override
  void onInit() {
    super.onInit();
    final Map<String, String?>? _parameters = Get.parameters;
    final deliveryJson = jsonDecode(_parameters?['delivery_model'] ?? '');
    deliveryModel.value = DeliveryModel.fromJson(deliveryJson);
    statusType.value = deliveryModel.value.state ?? 0;
    debounce(
      statusType,
      (_) {
        updateDeliveryState(statusType.value);
      },
      time: Duration(milliseconds: 500),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void updateDeliveryState(int state) async {
    switch (state) {
      case PackageConstants.confirmed:
        LoadingDialogUtils().loadingOverlayVisible(visible: true);
        BaseResponse response = await deliveryRemoteRepository.confirmedDelivery(
          warehouseId: deliveryModel.value.warehouseId ?? 0,
          customerId: deliveryModel.value.warehouse?.customerId ?? 0,
          packageId: deliveryModel.value.warehouse?.packages?.id ?? 0,
          deliveryId: deliveryModel.value.id ?? 0,
        );
        LoadingDialogUtils().loadingOverlayVisible(visible: false);
        if (response.success) {
          SnackBarUtils().showMessageSnackBar('Update Delivery Progress Successfully');
          final MainDriverController _mainController = Get.put(MainDriverController());
          _mainController.getDeliveriesUnconfirmed();
          _mainController.getDeliveriesInTransit();
          _mainController.getDeliveriesConfirmed();
        } else {
          SnackBarUtils().showErrorSnackBar('Update Delivery Progress Failed');
        }
        break;
      case PackageConstants.inTransit:
        LoadingDialogUtils().loadingOverlayVisible(visible: true);
        BaseResponse response = await deliveryRemoteRepository.inTransitDelivery(
          warehouseId: deliveryModel.value.warehouseId ?? 0,
          customerId: deliveryModel.value.warehouse?.customerId ?? 0,
          packageId: deliveryModel.value.warehouse?.packages?.id ?? 0,
          deliveryId: deliveryModel.value.id ?? 0,
        );
        LoadingDialogUtils().loadingOverlayVisible(visible: false);
        if (response.success) {
          SnackBarUtils().showMessageSnackBar('Update Delivery Progress Successfully');
          final MainDriverController _mainController = Get.put(MainDriverController());
          _mainController.getDeliveriesUnconfirmed();
          _mainController.getDeliveriesInTransit();
          _mainController.getDeliveriesConfirmed();
        } else {
          SnackBarUtils().showErrorSnackBar('Update Delivery Progress Failed');
        }
        break;
      case PackageConstants.shipSuccess:
        LoadingDialogUtils().loadingOverlayVisible(visible: true);
        BaseResponse response = await deliveryRemoteRepository.shipSuccessDelivery(
          warehouseId: deliveryModel.value.warehouseId ?? 0,
          customerId: deliveryModel.value.warehouse?.customerId ?? 0,
          packageId: deliveryModel.value.warehouse?.packages?.id ?? 0,
          deliveryId: deliveryModel.value.id ?? 0,
        );
        LoadingDialogUtils().loadingOverlayVisible(visible: false);
        if (response.success) {
          SnackBarUtils().showMessageSnackBar('Update Delivery Progress Successfully');
          final MainDriverController _mainController = Get.put(MainDriverController());
          _mainController.getDeliveriesUnconfirmed();
          _mainController.getDeliveriesInTransit();
          _mainController.getDeliveriesConfirmed();
        } else {
          SnackBarUtils().showErrorSnackBar('Update Delivery Progress Failed');
        }
        break;
    }
  }
}
