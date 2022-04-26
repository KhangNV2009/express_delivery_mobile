import 'dart:convert';

import 'package:express_delivery/app/components/app_bars/custom_app_bars.dart';
import 'package:express_delivery/app/components/base/base_screen_view.dart';
import 'package:express_delivery/app/components/buttons/custom_buttons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../../../components/book_truck/selection_tile.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_strings.dart';
import '../controllers/book_truck_controller.dart';

class BookTruckView extends GetView<BookTruckController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.BOOK_TRUCK_TEXT.tr,
        actions: [
          Obx(
            () => CustomButtons().actionButton(
              title: Strings.CREATE_TEXT.tr,
              onTap: controller.createDelivery,
              isEnable: controller.enableButton.value,
            ),
          ),
        ],
      ),
      body: BaseScreenView(
        child: Column(
          children: [
            SizedBox(height: 30),
            _buildSelections(),
          ],
        ),
      ),
    );
  }

  Container _buildSelections() {
    controller.selections.assignAll([
      Tuple3(Strings.SELECT_WAREHOUSE_TEXT.tr, () {
        Get.toNamed(Routes.CUSTOMER_SELECT_WAREHOUSE);
      }, false),
      Tuple3(Strings.SELECT_LOCATION_TEXT.tr, () {
        Get.toNamed(Routes.SELECT_LOCATION);
      }, false),
      Tuple3(Strings.CREATE_PACKAGE_TEXT.tr, () {
        final Map<String, String> _parameters = {};
        _parameters['package_model'] = jsonEncode(controller.packageModel.toJson());
        _parameters['warehouse_id'] = jsonEncode(controller.warehouseId);
        Get.toNamed(
          Routes.CUSTOMER_PACKAGE_CREATE,
          parameters: _parameters,
        );
      }, false),
    ]);
    return Container(
      child: Expanded(
        child: Obx(
          () => ListView.builder(
            itemCount: controller.selections.length,
            itemBuilder: (BuildContext context, index) {
              var selection = controller.selections[index];
              return SelectionTile(
                isEnable: selection.item3,
                title: selection.item1,
                onTap: selection.item2,
              );
            },
          ),
        ),
      ),
    );
  }
}
