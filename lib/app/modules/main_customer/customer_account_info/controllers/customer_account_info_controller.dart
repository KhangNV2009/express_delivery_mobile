import 'package:express_delivery/app/data/models/core/base_response.dart';
import 'package:express_delivery/app/data/models/location/location_model.dart';
import 'package:express_delivery/app/utils/snack_bar_utils.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/auth_remote_repository.dart';
import '../../../../data/storage/core_storage_manager.dart';

class CustomerAccountInfoController extends GetxController {
  /// services
  final authRemoteRepository = AuthRemoteRepository();

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

  void changeLocation({
    required double lat,
    required double lng,
    required String street,
    required String ward,
    required String district,
    required String city,
  }) async {
    BaseResponse response = await authRemoteRepository.changeLocation(
      lat: lat,
      lng: lng,
      street: street,
      ward: ward,
      district: district,
      city: city,
    );
    if (response.success) {
      final user = CoreStorageManager().getUser();
      user?.location = LocationModel(
        lat: lat,
        lng: lng,
        street: street,
        ward: ward,
        district: district,
        city: city,
      );
      CoreStorageManager().setUser(user);
      SnackBarUtils().showMessageSnackBar('Update address successfully');
    } else {
      SnackBarUtils().showErrorSnackBar('Update address failed');
    }
  }
}
