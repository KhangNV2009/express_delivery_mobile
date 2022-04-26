import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../../components/packages/package_tile.dart';
import '../controllers/warehouse_detail_controller.dart';

class InTransitWidget extends GetView<WarehouseDetailController> {
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
          controller.getPackagesInTransit();
        },
        child: AnimationLimiter(
          child: Obx(
                () => ListView.builder(
              itemCount: controller.packagesInTransit.length,
              itemBuilder: (BuildContext context, int index) {
                final package = controller.packagesInTransit[index];
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