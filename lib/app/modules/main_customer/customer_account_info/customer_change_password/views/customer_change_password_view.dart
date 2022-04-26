import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../components/app_bars/custom_app_bars.dart';
import '../../../../../components/base/base_screen_view.dart';
import '../../../../../components/buttons/custom_buttons.dart';
import '../../../../../components/text_fields/custom_text_field_white.dart';
import '../../../../../utils/app_strings.dart';
import '../controllers/customer_change_password_controller.dart';

class CustomerChangePasswordView extends GetView<CustomerChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.CHANGE_PASSWORD_TEXT.tr,
        actions: [
          Obx(
            () => CustomButtons().actionButton(
              title: Strings.SAVE_TEXT.tr,
              onTap: controller.changePassword,
              isEnable: controller.enableButton.value,
            ),
          ),
        ],
      ),
      body: BaseScreenView(
        child: Column(
          children: [
            SizedBox(height: 20),
            _buildCurrentPassword(),
            _buildNewPassword(),
            _buildConfirmPassword(),
          ],
        ),
      ),
    );
  }

  Container _buildCurrentPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: CustomTextFieldWhite(
        title: Strings.CURRENT_PASSWORD_TEXT.tr,
        isFocusable: false,
        controller: controller.currentPasswordController,
        maxLines: 1,
        obscureText: true,
        onTextChanged: controller.onCurrentPasswordChanged,
        hintText: Strings.PASSWORD_HINT_TEXT.tr,
      ),
    );
  }

  Container _buildNewPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: CustomTextFieldWhite(
        title: Strings.NEW_PASSWORD_TEXT.tr,
        isFocusable: false,
        controller: controller.newPasswordController,
        maxLines: 1,
        obscureText: true,
        onTextChanged: controller.onNewPasswordChanged,
        hintText: Strings.NEW_PASSWORD_HINT_TEXT.tr,
      ),
    );
  }

  Container _buildConfirmPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: CustomTextFieldWhite(
        title: Strings.CONFIRM_PASSWORD_TEXT.tr,
        isFocusable: false,
        controller: controller.confirmPasswordController,
        maxLines: 1,
        obscureText: true,
        onTextChanged: controller.onConfirmPasswordChanged,
        hintText: Strings.CONFIRM_PASSWORD_HINT_TEXT.tr,
      ),
    );
  }
}
