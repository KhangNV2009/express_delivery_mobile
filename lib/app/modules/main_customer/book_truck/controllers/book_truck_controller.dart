import 'package:express_delivery/app/data/models/core/base_response.dart';
import 'package:express_delivery/app/utils/snack_bar_utils.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../../../data/models/location/location_model.dart';
import '../../../../data/models/package/package_model.dart';
import '../../../../data/repositories/delivery_remote_repository.dart';

class BookTruckController extends GetxController {
  final selections = <Tuple3<String, dynamic, bool>>[].obs;
  PackageModel packageModel = PackageModel();
  int? warehouseId;
  LocationModel? locationModel;
  final enableButton = false.obs;

  /// services
  final deliveryRemoteRepository = DeliveryRemoteRepository();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void markSelected(int position) {
    var selectionsValue = selections.value;
    selectionsValue[position] = selectionsValue.elementAt(position).withItem3(true);
    selections.value = selectionsValue;
    selections.refresh();
    validateButton();
  }

  void validateButton() {
    enableButton.value = (selections.value.where((element) => element.item3 == true).length == 3);
  }

  void createDelivery() async {
    BaseResponse response = await deliveryRemoteRepository.createDelivery(
      warehouseId: warehouseId ?? 0,
      packageId: packageModel.id ?? 0,
      lat: locationModel?.lat ?? 0.0,
      lng: locationModel?.lng ?? 0.0,
      street: locationModel?.street ?? '',
      ward: locationModel?.ward ?? '',
      district: locationModel?.district ?? '',
      city: locationModel?.city ?? '',
    );
    if(response.success) {
      Get.back();
      SnackBarUtils().showMessageSnackBar('Create Delivery success fully');
    } else {
      SnackBarUtils().showErrorSnackBar('Create Delivery failed');
    }
  }
}
