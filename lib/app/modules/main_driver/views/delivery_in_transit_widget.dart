import 'dart:convert';

import 'package:express_delivery/app/modules/main_driver/controllers/main_driver_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../components/deliveries/delivery_tile.dart';
import '../../../routes/app_pages.dart';

class DeliveryInTransitWidget extends GetView<MainDriverController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildDeliveries(),
        ],
      ),
    );
  }

  Widget _buildDeliveries() {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          controller.getDeliveriesInTransit();
        },
        child: AnimationLimiter(
          child: Obx(
            () => ListView.builder(
              itemCount: controller.inTransitDeliveries.length,
              itemBuilder: (BuildContext context, int index) {
                final delivery = controller.inTransitDeliveries[index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: DeliveryTile(
                        id: delivery.id ?? 0,
                        address: delivery.location?.address ?? '',
                        date: delivery.createdAt ?? '',
                        onDetailClick: () {
                          final Map<String, String> _parameters = {};
                          _parameters['delivery_model'] = jsonEncode(delivery.toJson());
                          Get.toNamed(
                            Routes.DELIVERY_DETAIL,
                            parameters: _parameters,
                          );
                        },
                        statusType: 4,
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
