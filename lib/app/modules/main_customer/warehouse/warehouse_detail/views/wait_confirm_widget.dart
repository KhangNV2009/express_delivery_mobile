import 'package:express_delivery/app/components/packages/package_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../controllers/warehouse_detail_controller.dart';

class WaitConfirmWidget extends GetView<WarehouseDetailController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10),
          _buildNotifications(),
        ],
      ),
    );
  }

  Widget _buildNotifications() {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          controller.getPackagesWaitConfirm();
        },
        child: AnimationLimiter(
          child: Obx(
                () => ListView.builder(
              itemCount: controller.packagesWait.length,
              itemBuilder: (BuildContext context, int index) {
                final package = controller.packagesWait[index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: PackageTile(
                        title: package.name ?? '',
                        description: package.category ?? '',
                        weight: '${package.weight}',
                        onTap: () {},
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
