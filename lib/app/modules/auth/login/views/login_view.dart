import 'package:express_delivery/app/components/base/base_screen_view.dart';
import 'package:express_delivery/app/components/text_fields/custom_text_field.dart';
import 'package:express_delivery/app/constants/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../components/buttons/custom_buttons.dart';
import '../../../../constants/custom_colors.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_strings.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScreenView(
        child: Container(
          color: CustomColors.blue236,
          child: SingleChildScrollView(
            child: Container(
              height: Get.height,
              width: Get.width,
              child: Column(
                children: [
                  _buildLoginContainer(),
                  _buildRegisterContainer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginContainer() {
    return Expanded(
      flex: 4,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 28),
              child: Assets.images.imgLogo.image(
                height: 300,
                width: 300,
              ),
            ),
            Column(
              children: [
                SizedBox(height: 200),
                _buildLoginInput(),
                _buildPasswordInput(),
                SizedBox(height: 20),
                _buildLoginButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterContainer() {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          SizedBox(height: 28),
          _buildTitleOr(),
          SizedBox(height: 18),
          _buildRegisterButton(),
        ],
      ),
    );
  }

  Container _buildLoginInput() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Obx(
        () => CustomTextField(
          controller: controller.emailController,
          isFocusable: false,
          hintText: Strings.EMAIL_TITLE_TEXT.tr,
          onTextChanged: controller.onEmailChanged,
          errorText: controller.emailErrorText.value,
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
          hintText: Strings.PASSWORD_TITLE_TEXT.tr,
          onTextChanged: controller.onPasswordChanged,
          errorText: controller.passwordErrorText.value,
        ),
      ),
    );
  }

  Container _buildLoginButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Obx(
        () => CustomButtons().primaryButton(
          title: Strings.LOGIN_TEXT.tr,
          onTap: () async {
            await controller.login();
          },
          isEnable: controller.enableButton.value,
        ),
      ),
    );
  }

  Container _buildTitleOr() {
    return Container(
      child: Text(
        Strings.OR_TEXT.tr.toUpperCase(),
        style: CustomTextStyles.zeplin22pt().copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container _buildRegisterButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 70),
      child: CustomButtons().secondaryButton(
        title: Strings.REGISTER_TEXT.tr.toUpperCase(),
        onTap: () {
          Get.toNamed(Routes.REGISTER);
        },
        isEnable: true,
      ),
    );
  }
}
