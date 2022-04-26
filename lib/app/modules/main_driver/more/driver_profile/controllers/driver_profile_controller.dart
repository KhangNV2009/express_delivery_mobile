import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/models/user/user_model.dart';
import '../../../../../data/repositories/auth_remote_repository.dart';
import '../../../../../data/storage/core_storage_manager.dart';

class DriverProfileController extends GetxController {
  final Rxn<UserModel> userModel = Rxn<UserModel>();

  /// user info text field
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    userModel.value = CoreStorageManager().getUser();
    initAccountInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void initAccountInfo() {
    fullNameController.text = userModel.value?.fullName ?? '';
    emailController.text = userModel.value?.email ?? '';
    phoneController.text = userModel.value?.phoneNumber ?? '';
    addressController.text = userModel.value?.location?.address ?? '';
  }

  void onFullNameChanged(String value) {
  }

  void onPhoneNumberChanged(String value) {
  }


}
