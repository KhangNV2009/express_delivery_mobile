import 'package:express_delivery/app/components/app_bars/custom_app_bars.dart';
import 'package:express_delivery/app/components/base/base_screen_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../components/warehouse/warehouse_tile.dart';
import '../../../../../utils/app_strings.dart';
import '../../controllers/book_truck_controller.dart';
import '../controllers/customer_select_warehouse_controller.dart';

class CustomerSelectWarehouseView extends GetView<CustomerSelectWarehouseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.SELECT_WAREHOUSE_TEXT.tr,
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
                  controller.onTapWarehouse(warehouseId: warehouse.id ?? 0);
                },
              );
            });
          },
        ),
      ),
    );
  }
}
