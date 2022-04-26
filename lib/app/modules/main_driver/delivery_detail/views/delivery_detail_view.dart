import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../components/app_bars/custom_app_bars.dart';
import '../../../../components/base/base_screen_view.dart';
import '../../../../components/buttons/custom_buttons.dart';
import '../../../../components/deliveries/delivery_detail_info_widget.dart';
import '../../../../constants/custom_colors.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/date_time_utils.dart';
import '../controllers/delivery_detail_controller.dart';
import 'delivery_detail_status_widget.dart';

class DeliveryDetailView extends GetView<DeliveryDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.DELIVERY_DETAIL_TEXT.tr,
      ),
      body: BaseScreenView(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 18),
                DeliveryDetailInfoWidget(
                  title: '${Strings.ORDER_TEXT.tr}: ${controller.deliveryModel.value.id}',
                  fromAddress: '${controller.deliveryModel.value.location?.address}',
                  fromLatLng: LatLng(
                    double.parse(controller.deliveryModel.value.location?.lat),
                    double.parse(controller.deliveryModel.value.location?.lng),
                  ),
                  toAddress: '${controller.deliveryModel.value.warehouse?.location?.address}',
                  toLatLng: LatLng(
                    double.parse(controller.deliveryModel.value.warehouse?.location?.lat),
                    double.parse(controller.deliveryModel.value.warehouse?.location?.lng),
                  ),
                  date:
                      DateTimeUtils.parseToDateTime(controller.deliveryModel.value.createdAt ?? ''),
                ),
                SizedBox(height: 18),
                Obx(
                  () => DeliveryDetailStatusWidget(
                    width: Get.width,
                    onItemStatusClick: (type) {
                      if (controller.statusType.value >= 4) {
                        if (type == 4 || type == 5) {
                          controller.statusType.value = type;
                        }
                      } else {
                        if (type == 2 || type == 3 || type == 4) {
                          controller.statusType.value = type;
                        }
                      }
                    },
                    statusType: controller.statusType.value,
                  ),
                ),
                SizedBox(height: 18),
                SizedBox(height: 18),
                _buildReportButton(),
                SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildReportButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: CustomButtons().colorIconButton(
        icon: Assets.images.imgIconReportTrouble,
        title: Strings.DELIVERY_REPORT_TEXT.tr,
        onTap: () {
          final Map<String, String> _parameters = {};
          _parameters['customer_id'] = jsonEncode(controller.deliveryModel.value.customerId);
          _parameters['delivery_id'] = jsonEncode(controller.deliveryModel.value.id);
          Get.toNamed(
            Routes.DRIVER_CREATE_REPORT,
            parameters: _parameters,
          );
        },
        backgroundColor: CustomColors.yellow29,
        textColor: Colors.white,
      ),
    );
  }
}
