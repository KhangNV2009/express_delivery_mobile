import 'dart:io';

import 'package:express_delivery/app/components/buttons/custom_buttons.dart';
import 'package:express_delivery/app/constants/core_remote_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../../../components/app_bars/custom_app_bars.dart';
import '../../../../../components/base/base_screen_view.dart';
import '../../../../../components/text_fields/custom_text_field_white.dart';
import '../../../../../constants/custom_colors.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../../utils/image_utils.dart';
import '../controllers/customer_profile_controller.dart';

class CustomerProfileView extends GetView<CustomerProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.ACCOUNT_INFO_TEXT.tr,
        actions: [
          Obx(
            () => CustomButtons().actionButton(
              title: Strings.SAVE_TEXT.tr,
              onTap: controller.changeProfile,
              isEnable: controller.enableButton.value,
            ),
          ),
        ],
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
                _buildAddress(),
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
              child: Obx(
                () => ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: controller.avatarPath.isEmpty
                      ? ImageUtils().loadImageUrl(
                          blurHash: '',
                          imageUrl: '${CoreRemoteConstants.baseImageUrl}'
                              '${controller.userModel.value?.avatar}',
                          width: 100,
                          height: 100,
                          boxFit: BoxFit.cover,
                        )
                      : Image.file(
                          File(controller.avatarPath.value),
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                color: CustomColors.gray167,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: controller.showChangeAvatar,
                  child: Icon(
                    FontAwesomeIcons.penToSquare,
                    size: 16,
                    color: Colors.white,
                  ),
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
        isEnable: true,
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
        isEnable: true,
      ),
    );
  }

  Container _buildAddress() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: CustomTextFieldWhite(
        title: Strings.ADDRESS_TEXT.tr,
        isFocusable: false,
        controller: controller.addressController,
        isEnable: false,
        maxLines: 2,
        height: 66,
      ),
    );
  }
}
