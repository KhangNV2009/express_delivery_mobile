import 'dart:io';

import 'package:express_delivery/app/components/dialogs/custom_dialogs.dart';
import 'package:express_delivery/app/data/models/token/token_response.dart';
import 'package:express_delivery/app/data/repositories/auth_remote_repository.dart';
import 'package:express_delivery/app/data/services/loading_dialog_service.dart';
import 'package:express_delivery/app/data/storage/core_storage_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/models/register/register_request.dart';
import '../../../../data/models/user/user_response.dart';
import '../../../../data/repositories/app_device_remote_repository.dart';
import '../../../../data/services/core_service.dart';
import '../../../../data/services/firebase_service.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_strings.dart';

class RegisterController extends GetxController {
  /// full name
  String? fullName;
  final fullNameController = TextEditingController();
  final fullNameErrorText = ''.obs;

  /// phone number
  String? phoneNumber;
  final phoneNumberController = TextEditingController();
  final phoneNumberErrorText = ''.obs;

  /// email
  String? email;
  final emailController = TextEditingController();
  final emailErrorText = ''.obs;

  /// password
  String? password;
  final passwordController = TextEditingController();
  final passwordErrorText = ''.obs;

  /// confirm password
  String? confirmPassword;
  final confirmPasswordController = TextEditingController();
  final confirmPasswordErrorText = ''.obs;

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

  void onFullNameChanged(String value) {
    fullName = value;
    if (value.isEmpty) {
      fullNameErrorText.value = Strings.INPUT_REQUIRED_ERROR_TEXT.tr;
    } else {
      fullNameErrorText.value = '';
    }
    validateButton();
  }

  void onPhoneNumberChanged(String value) {
    phoneNumber = value;
    if (value.length < 10) {
      phoneNumberErrorText.value = Strings.PHONE_NUMBER_ERROR_TEXT.tr;
    } else {
      phoneNumberErrorText.value = '';
    }
    validateButton();
  }

  void onEmailChanged(String value) {
    email = value;
    if (!GetUtils.isEmail(value)) {
      emailErrorText.value = Strings.EMAIL_ERROR_TEXT.tr;
    } else {
      emailErrorText.value = '';
    }
    validateButton();
  }

  void onPasswordChanged(String value) {
    password = value;
    if (value.length < 6) {
      passwordErrorText.value = Strings.PASSWORD_ERROR_TEXT.tr;
    } else {
      passwordErrorText.value = '';
    }
    validateButton();
  }

  void onConfirmChanged(String value) {
    confirmPassword = value;
    if (value != password) {
      confirmPasswordErrorText.value = Strings.CONFIRM_PASSWORD_ERROR_TEXT.tr;
    } else {
      confirmPasswordErrorText.value = '';
    }
    validateButton();
  }

  void validateButton() {
    enableButton.value = (fullName?.isNotEmpty ?? false) &&
        ((phoneNumber?.length ?? 0) > 9) &&
        GetUtils.isEmail(email ?? '') &&
        ((password?.length ?? 0) > 5) &&
        (confirmPassword == password);
  }

  Future<void> register() async {
    final request = RegisterRequest(
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      fullName: fullName,
    );
    LoadingDialogUtils().loadingOverlayVisible(visible: true);
    TokenResponse response = await authRemoteRepository.register(request: request);
    if (response.success) {
      CoreStorageManager().setRefreshToken(response.data?.refreshToken);
      CoreStorageManager().setAccessToken(response.data?.accessToken);
      CoreStorageManager().setRole(1);
      await CoreService().requestRefreshToken();
      Get.offAllNamed(Routes.MAIN_CUSTOMER);
      await getUserInfo();
      await createAppDevice();
      LoadingDialogUtils().loadingOverlayVisible(visible: false);
    } else {
      LoadingDialogUtils().loadingOverlayVisible(visible: false);
      CustomDialogs().errorDialog(
        onTap: () {
          Get.back();
        },
        description: Strings.DESCRIPTION_REGISTER_ERROR_TEXT.tr,
      );
    }
  }

  Future<void> getUserInfo() async {
    UserResponse response = await authRemoteRepository.me();
    if (response.success) {
      CoreStorageManager().setUser(response.data);
      CoreStorageManager().setRole(response.data?.roleId ?? 0);
      if(CoreStorageManager().getRole() == 1) {
        Get.offAllNamed(Routes.MAIN_CUSTOMER);
      }
      if(CoreStorageManager().getRole() == 2) {
        Get.offAllNamed(Routes.MAIN_DRIVER);
      }
    } else {
      CustomDialogs().errorDialog(
        onTap: () {
          Get.back();
        },
        description: Strings.DESCRIPTION_LOGIN_ERROR_TEXT.tr,
      );
      LoadingDialogUtils().loadingOverlayVisible(visible: false);
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
