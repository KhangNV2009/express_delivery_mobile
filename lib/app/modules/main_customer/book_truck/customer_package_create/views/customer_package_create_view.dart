import 'package:express_delivery/app/components/app_bars/custom_app_bars.dart';
import 'package:express_delivery/app/components/base/base_screen_view.dart';
import 'package:express_delivery/app/components/buttons/custom_buttons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../components/text_fields/custom_text_field_white.dart';
import '../../../../../utils/app_strings.dart';
import '../controllers/customer_package_create_controller.dart';

class CustomerPackageCreateView extends GetView<CustomerPackageCreateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.CREATE_PACKAGE_TEXT.tr,
        actions: [
          Obx(
            () => CustomButtons().actionButton(
              title: Strings.CREATE_TEXT.tr,
              onTap: controller.createPackage,
              isEnable: controller.enableButton.value,
            ),
          ),
        ],
      ),
      body: BaseScreenView(
        child: Column(
          children: [
            SizedBox(height: 20),
            _buildName(),
            _buildWeight(),
            _buildCategory(),
          ],
        ),
      ),
    );
  }

  Container _buildName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: CustomTextFieldWhite(
        title: Strings.NAME_PACKAGE_TEXT.tr,
        isFocusable: false,
        controller: controller.nameController,
        isEnable: true,
        maxLines: 1,
        height: 44,
        keyboardType: TextInputType.text,
        onTextChanged: controller.onNameChanged,
      ),
    );
  }

  Container _buildWeight() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: CustomTextFieldWhite(
        title: Strings.WEIGHT_PACKAGE_TEXT.tr,
        isFocusable: false,
        controller: controller.weightController,
        isEnable: true,
        maxLines: 1,
        height: 44,
        keyboardType: TextInputType.numberWithOptions(),
        onTextChanged: controller.onWeightChanged,
      ),
    );
  }

  Container _buildCategory() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: CustomTextFieldWhite(
        title: Strings.CATEGORY_PACKAGE_TEXT.tr,
        isFocusable: false,
        controller: controller.categoryController,
        isEnable: true,
        maxLines: 1,
        height: 44,
        keyboardType: TextInputType.text,
        onTextChanged: controller.onCategoryChanged,
      ),
    );
  }
}
