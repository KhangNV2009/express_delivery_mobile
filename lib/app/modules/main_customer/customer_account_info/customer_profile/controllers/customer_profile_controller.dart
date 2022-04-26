import 'package:express_delivery/app/components/dialogs/custom_dialogs.dart';
import 'package:express_delivery/app/data/models/user/user_model.dart';
import 'package:express_delivery/app/data/services/loading_dialog_service.dart';
import 'package:express_delivery/app/data/storage/core_storage_manager.dart';
import 'package:express_delivery/app/modules/main_customer/controllers/main_customer_controller.dart';
import 'package:express_delivery/app/utils/snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/models/core/base_response.dart';
import '../../../../../data/models/user/user_avatar_response.dart';
import '../../../../../data/repositories/auth_remote_repository.dart';
import '../../../../../utils/image_picker_utils.dart';

class CustomerProfileController extends GetxController {
  final Rxn<UserModel> userModel = Rxn<UserModel>();

  /// services
  final authRemoteRepository = AuthRemoteRepository();

  /// user info text field
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  final avatarPath = ''.obs;

  final enableButton = false.obs;

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
    validateButton();
  }

  void onPhoneNumberChanged(String value) {
    validateButton();
  }

  void validateButton() {
    enableButton.value = fullNameController.text.isNotEmpty && phoneController.text.isNotEmpty;
  }

  void changeProfile() async {
    LoadingDialogUtils().loadingOverlayVisible(visible: true);
    BaseResponse response = await authRemoteRepository.updateProfile(
      fullName: fullNameController.text,
      phoneNumber: phoneController.text,
    );
    LoadingDialogUtils().loadingOverlayVisible(visible: false);
    if (response.success) {
      final user = userModel.value;
      user?.phoneNumber = phoneController.text;
      user?.fullName = fullNameController.text;
      CoreStorageManager().setUser(user);
      SnackBarUtils().showMessageSnackBar('Update profile successfully');
      enableButton.value = false;
    } else {
      SnackBarUtils().showErrorSnackBar('Error');
    }
  }

  void showChangeAvatar() {
    CustomDialogs().showChangeAvatarDialog(
      onCameraPick: () async {
        final path = await ImagePickerUtils().getImagePathCamera();
        if (path != null) {
          updateAvatar(path);
        }
        Get.back();
      },
      onGalleryPick: () async {
        final path = await ImagePickerUtils().getImagePathGallery();
        if (path != null) {
          updateAvatar(path);
        }
        Get.back();
      },
    );
  }

  void updateAvatar(String path) async {
    UserAvatarResponse response = await authRemoteRepository.updateAvatar(avatarPath: path);
    if (response.success) {
      avatarPath.value = path;
      final user = userModel.value;
      user?.avatar = response.data ?? '';
      CoreStorageManager().setUser(user);
      SnackBarUtils().showMessageSnackBar('Update avatar successfully');
      final _mainController = Get.find<MainCustomerController>();
      _mainController.userModel.value = CoreStorageManager().getUser();
    } else {
      SnackBarUtils().showErrorSnackBar('Error');
    }
  }
}
