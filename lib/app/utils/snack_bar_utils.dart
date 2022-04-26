import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/custom_colors.dart';
import 'app_strings.dart';

class SnackBarUtils {
  void showErrorSnackBar(String errorMessage) {
    Get.snackbar(
      Strings.ERROR_TEXT.tr,
      errorMessage,
      snackPosition: SnackPosition.TOP,
      backgroundGradient: LinearGradient(colors: [
        CustomColors.red13,
        CustomColors.gray90,
      ]),
      backgroundColor: Colors.black.withOpacity(0.75),
      margin: EdgeInsets.only(bottom: 20),
      colorText: Colors.white,
      icon: Icon(
        Icons.cloud_off,
        color: Colors.white,
      ),
      shouldIconPulse: true,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  void showMessageSnackBar(String message) {
    Get.snackbar(
      Strings.SUCCESS_TEXT.tr,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundGradient: LinearGradient(colors: [
        CustomColors.green97,
        CustomColors.green186,
      ]),
      backgroundColor: Colors.white.withOpacity(0.5),
      margin: EdgeInsets.only(bottom: 20),
      colorText: Colors.black54,
      icon: Icon(
        Icons.info_outline_rounded,
        color: Colors.black54,
      ),
      shouldIconPulse: true,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  void showWarningSnackBar(String message) {
    Get.snackbar(
      Strings.WARNING_TEXT.tr,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundGradient: LinearGradient(colors: [
        CustomColors.yellow232,
        CustomColors.blue178,
      ]),
      backgroundColor: Colors.white.withOpacity(0.5),
      margin: EdgeInsets.only(bottom: 20),
      colorText: Colors.black54,
      icon: Icon(
        Icons.info_outline_rounded,
        color: Colors.black54,
      ),
      shouldIconPulse: true,
      snackStyle: SnackStyle.FLOATING,
    );
  }
}
