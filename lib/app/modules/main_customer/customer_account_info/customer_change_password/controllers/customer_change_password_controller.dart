import 'package:express_delivery/app/data/services/loading_dialog_service.dart';
import 'package:express_delivery/app/utils/snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/models/core/base_response.dart';
import '../../../../../data/repositories/auth_remote_repository.dart';

class CustomerChangePasswordController extends GetxController {
  String? currentPassword;
  final currentPasswordController = TextEditingController();

  String? newPassword;
  bool validateNewPassword = false;
  final newPasswordController = TextEditingController();

  String? confirmPassword;
  bool validateConfirmPassword = false;
  final confirmPasswordController = TextEditingController();

  final enableButton = false.obs;

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

  void onCurrentPasswordChanged(String value) {
    currentPassword = value;
    validateSaveButton();
  }

  void onNewPasswordChanged(String value) {
    newPassword = value;
    validateNewPassword = ((newPassword?.length ?? 0) > 5);
    validateSaveButton();
  }

  void onConfirmPasswordChanged(String value) {
    confirmPassword = value;
    validateConfirmPassword = (confirmPassword == newPassword);
    validateSaveButton();
  }

  void validateSaveButton() {
    enableButton.value =
        (currentPassword ?? '').isNotEmpty && validateNewPassword && validateConfirmPassword;
  }

  void changePassword() async {
    LoadingDialogUtils().loadingOverlayVisible(visible: true);
    BaseResponse response = await authRemoteRepository.changePassword(
      oldPassword: currentPasswordController.text,
      newPassword: newPasswordController.text,
    );
    LoadingDialogUtils().loadingOverlayVisible(visible: false);
    if(response.success) {
      SnackBarUtils().showMessageSnackBar('Update password successfully');
      enableButton.value = false;
    } else {
      SnackBarUtils().showErrorSnackBar('Update password failed');
    }
  }
}
