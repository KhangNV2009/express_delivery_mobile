import 'package:express_delivery/app/components/app_bars/custom_app_bars.dart';
import 'package:express_delivery/app/components/base/base_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/buttons/custom_buttons.dart';
import '../../../../components/text_fields/custom_text_field.dart';
import '../../../../utils/app_strings.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().whiteAppBar(
        title: Strings.REGISTER_TEXT.tr.toUpperCase(),
      ),
      body: BaseScreenView(
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            width: Get.width,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    children: [
                      _buildFullNameInput(),
                      _buildPhoneNumberInput(),
                      _buildEmailInput(),
                      _buildPasswordInput(),
                      _buildConfirmPasswordInput(),
                      _buildRegisterButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildFullNameInput() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Obx(
        () => CustomTextField(
          controller: controller.fullNameController,
          isFocusable: false,
          hintText: Strings.FULL_NAME_TEXT.tr.toUpperCase(),
          errorText: controller.fullNameErrorText.value,
          onTextChanged: controller.onFullNameChanged,
        ),
      ),
    );
  }

  Container _buildEmailInput() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Obx(
        () => CustomTextField(
          controller: controller.emailController,
          isFocusable: false,
          hintText: Strings.EMAIL_TITLE_TEXT.tr.toUpperCase(),
          errorText: controller.emailErrorText.value,
          onTextChanged: controller.onEmailChanged,
        ),
      ),
    );
  }

  Container _buildPhoneNumberInput() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Obx(
        () => CustomTextField(
          controller: controller.phoneNumberController,
          isFocusable: false,
          inputType: TextInputType.phone,
          hintText: Strings.PHONE_NUMBER_TEXT.tr.toUpperCase(),
          errorText: controller.phoneNumberErrorText.value,
          onTextChanged: controller.onPhoneNumberChanged,
        ),
      ),
    );
  }

  Container _buildPasswordInput() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Obx(
        () => CustomTextField(
          controller: controller.passwordController,
          isFocusable: false,
          obscureText: true,
          hintText: Strings.PASSWORD_TITLE_TEXT.tr.toUpperCase(),
          errorText: controller.passwordErrorText.value,
          onTextChanged: controller.onPasswordChanged,
        ),
      ),
    );
  }

  Container _buildConfirmPasswordInput() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Obx(
        () => CustomTextField(
          controller: controller.confirmPasswordController,
          isFocusable: false,
          obscureText: true,
          onTextChanged: controller.onConfirmChanged,
          hintText: Strings.CONFIRM_PASSWORD_TEXT.tr.toUpperCase(),
          errorText: controller.confirmPasswordErrorText.value,
        ),
      ),
    );
  }

  Container _buildRegisterButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Obx(
        () => CustomButtons().primaryButton(
          title: Strings.REGISTER_TEXT.tr.toUpperCase(),
          onTap: () async {
            await controller.register();
          },
          isEnable: controller.enableButton.value,
        ),
      ),
    );
  }
}
