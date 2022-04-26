import 'dart:convert';

import 'package:express_delivery/app/components/app_bars/custom_app_bars.dart';
import 'package:express_delivery/app/components/base/base_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../components/warehouse/warehouse_tile.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_strings.dart';
import '../controllers/warehouse_controller.dart';

class WarehouseView extends GetView<WarehouseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.WAREHOUSE_MANAGEMENT_TEXT.tr,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.WAREHOUSE_CREATE);
            },
            icon: Icon(FontAwesomeIcons.circlePlus),
          ),
        ],
      ),
      body: BaseScreenView(
        child: Column(
          children: [
            _buildWarehouseList(),
          ],
        ),
      ),
    );
  }

  Widget _buildWarehouseList() {
    return Obx(
      () => Expanded(
        child: ListView.builder(
          itemCount: controller.warehouses.length,
          itemBuilder: (BuildContext context, int index) {
            return Obx(() {
              final warehouse = controller.warehouses[index];
              final location = warehouse.location;
              final address = '${location?.street} ${location?.district}, ${location?.city}';
              return WarehouseTile(
                title: warehouse.name ?? '',
                address: address,
                onTap: () {
                  final Map<String, String> parameters = {};
                  parameters['warehouse_id'] = jsonEncode(warehouse.id);
                  Get.toNamed(
                    Routes.WAREHOUSE_DETAIL,
                    parameters: parameters,
                  );
                },
              );
            });
          },
        ),
      ),
    );
  }
}
