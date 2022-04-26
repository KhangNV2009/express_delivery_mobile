import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/app_bars/custom_app_bars.dart';
import '../../../../../components/base/base_screen_view.dart';
import '../../../../../components/text_fields/custom_text_field_white.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../../utils/image_utils.dart';
import '../controllers/driver_profile_controller.dart';

class DriverProfileView extends GetView<DriverProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.ACCOUNT_INFO_TEXT.tr,
      ),
      body: BaseScreenView(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                _buildAvatar(),
                SizedBox(height: 20),
                _buildFullName(),
                _buildEmail(),
                _buildPhoneNumber(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildAvatar() {
    return Container(
      height: 100,
      width: 100,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: ImageUtils().loadImageUrl(
                  blurHash: '',
                  imageUrl:
                      'https://i.pinimg.com/736x/cc/27/0b/cc270b494057ad88b2a6e09fe0044f00.jpg',
                  width: 100,
                  height: 100,
                  boxFit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildFullName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: CustomTextFieldWhite(
        title: Strings.FULL_NAME_TEXT.tr,
        isFocusable: false,
        controller: controller.fullNameController,
        maxLines: 1,
        onTextChanged: controller.onFullNameChanged,
        isEnable: false,
      ),
    );
  }

  Container _buildEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: CustomTextFieldWhite(
        title: 'Email',
        isFocusable: false,
        keyboardType: TextInputType.text,
        controller: controller.emailController,
        maxLines: 1,
        isEnable: false,
      ),
    );
  }

  Container _buildPhoneNumber() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: CustomTextFieldWhite(
        title: Strings.PHONE_NUMBER_TEXT.tr,
        isFocusable: false,
        controller: controller.phoneController,
        maxLines: 1,
        keyboardType: TextInputType.phone,
        onTextChanged: controller.onPhoneNumberChanged,
        isEnable: false,
      ),
    );
  }
}
