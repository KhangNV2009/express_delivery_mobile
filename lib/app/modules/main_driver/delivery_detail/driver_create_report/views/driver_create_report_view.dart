import 'package:express_delivery/app/components/app_bars/custom_app_bars.dart';
import 'package:express_delivery/app/components/base/base_screen_view.dart';
import 'package:express_delivery/app/components/buttons/custom_buttons.dart';
import 'package:express_delivery/app/components/text_fields/custom_text_field_white.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../utils/app_strings.dart';
import '../controllers/driver_create_report_controller.dart';

class DriverCreateReportView extends GetView<DriverCreateReportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.DELIVERY_REPORT_TEXT.tr,
        actions: [
          Obx(
            () => CustomButtons().actionButton(
              title: Strings.CREATE_TEXT.tr,
              onTap: controller.sendReport,
              isEnable: controller.enableButton.value,
            ),
          ),
        ],
      ),
      body: BaseScreenView(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildTitle(),
              _buildDescription(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: CustomTextFieldWhite(
        title: 'Title',
        onTextChanged: controller.onTitleChanged,
        controller: controller.titleController,
        isFocusable: false,
      ),
    );
  }

  Container _buildDescription() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: CustomTextFieldWhite(
        title: 'Description',
        controller: controller.descriptionController,
        isFocusable: false,
        onTextChanged: controller.onDescriptionChanged,
        maxLines: 5,
        height: 132,
      ),
    );
  }
}
