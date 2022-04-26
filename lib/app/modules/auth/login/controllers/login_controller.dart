import 'dart:io';

import 'package:express_delivery/app/data/services/firebase_service.dart';
import 'package:express_delivery/app/data/storage/core_storage_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../components/dialogs/custom_dialogs.dart';
import '../../../../data/models/core/base_response.dart';
import '../../../../data/models/token/token_response.dart';
import '../../../../data/models/user/user_response.dart';
import '../../../../data/repositories/app_device_remote_repository.dart';
import '../../../../data/repositories/auth_remote_repository.dart';
import '../../../../data/services/core_service.dart';
import '../../../../data/services/loading_dialog_service.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_strings.dart';

class LoginController extends GetxController {
  /// email
  String? email;
  final emailController = TextEditingController();
  final emailErrorText = ''.obs;

  /// password
  String? password;
  final passwordController = TextEditingController();
  final passwordErrorText = ''.obs;

  /// button
  final enableButton = false.obs;

  /// remote repository
  final authRemoteRepository = AuthRemoteRepository();
  final appDeviceRemoteRepository = AppDeviceRemoteRepository();

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

  void onEmailChanged(String value) {
    email = value;
    if (GetUtils.isEmail(value)) {
      emailErrorText.value = '';
    } else {
      emailErrorText.value = Strings.EMAIL_ERROR_TEXT.tr;
    }
    validateButton();
  }

  void onPasswordChanged(String value) {
    password = value;
    if (value.length > 5) {
      passwordErrorText.value = '';
    } else {
      passwordErrorText.value = Strings.PASSWORD_ERROR_TEXT.tr;
    }
    validateButton();
  }

  void validateButton() {
    enableButton.value = (GetUtils.isEmail(email ?? '')) && ((password?.length ?? 0) > 5);
  }

  Future<void> login() async {
    LoadingDialogUtils().loadingOverlayVisible(visible: true);
    TokenResponse response = await authRemoteRepository.login(
      email: email ?? '',
      password: password ?? '',
    );
    if (response.success) {
      CoreStorageManager().setAccessToken(response.data?.accessToken);
      CoreStorageManager().setRefreshToken(response.data?.refreshToken);
      await CoreService().requestRefreshToken();
      await getUserInfo();
      await createAppDevice();
      LoadingDialogUtils().loadingOverlayVisible(visible: false);
    } else {
      LoadingDialogUtils().loadingOverlayVisible(visible: false);
      CustomDialogs().errorDialog(
        onTap: () {
          Get.back();
        },
        description: Strings.DESCRIPTION_LOGIN_ERROR_TEXT.tr,
      );
    }
  }

  Future<void> getUserInfo() async {
    UserResponse response = await authRemoteRepository.me();
    if (response.success) {
      CoreStorageManager().setUser(response.data);
      CoreStorageManager().setRole(response.data?.roleId ?? 0);
      if (CoreStorageManager().getRole() == 1) {
        Get.offAllNamed(Routes.MAIN_CUSTOMER);
      }
      if (CoreStorageManager().getRole() == 2) {
        Get.offAllNamed(Routes.MAIN_DRIVER);
      }
    } else {
      CustomDialogs().errorDialog(
        onTap: () {
          Get.back();
        },
        description: Strings.DESCRIPTION_LOGIN_ERROR_TEXT.tr,
      );
    }
  }

  Future<void> createAppDevice() async {
    String? platform;
    if (Platform.isAndroid) {
      platform = 'android';
    } else {
      platform = 'ios';
    }
    final String token = await FirebaseService.singleton.initToken() ?? '';
    await appDeviceRemoteRepository.createAppDevice(
      platform: platform,
      token: token,
    );
  }
}
