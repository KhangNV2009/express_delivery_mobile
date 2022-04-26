import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../../../components/app_bars/custom_app_bars.dart';
import '../../../../../components/base/base_screen_view.dart';
import '../../../../../components/buttons/custom_buttons.dart';
import '../../../../../components/text_fields/custom_text_field_white.dart';
import '../../../../../constants/custom_colors.dart';
import '../../../../../constants/custom_text_styles.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../utils/app_strings.dart';
import '../controllers/warehouse_edit_controller.dart';

class WarehouseEditView extends GetView<WarehouseEditController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.WAREHOUSE_EDIT_TEXT.tr,
        actions: [
          IconButton(
            onPressed: controller.deleteWarehouse,
            icon: Icon(
              FontAwesomeIcons.trashCan,
            ),
          ),
          Obx(
            () => CustomButtons().actionButton(
              title: Strings.SAVE_TEXT.tr,
              onTap: controller.editWarehouse,
              isEnable: controller.enableButton.value,
            ),
          ),
        ],
      ),
      body: BaseScreenView(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                _buildWarehouseNameTextField(),
                _buildAddressText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddressText() {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address:',
            style: CustomTextStyles.zeplin12p5pt().copyWith(
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Obx(
              () => Text(
                controller.address.value,
                maxLines: 3,
                style: CustomTextStyles.zeplin8pt().copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          CustomButtons().textButton(
            title: Strings.SELECT_WAREHOUSE_LOCATION_TEXT.tr,
            onTap: () {
              Get.toNamed(Routes.SELECT_LOCATION);
            },
            backgroundColor: CustomColors.gray209,
            textStyle: CustomTextStyles.zeplin8pt().copyWith(
              color: CustomColors.blue178,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarehouseNameTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: CustomTextFieldWhite(
        isFocusable: false,
        title: Strings.WAREHOUSE_NAME_TEXT.tr,
        controller: controller.warehouseNameController,
        onTextChanged: controller.onWarehouseNameChanged,
        height: 50,
      ),
    );
  }
}
