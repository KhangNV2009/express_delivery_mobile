import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../components/notification/error_notification_tile.dart';
import '../../../constants/custom_colors.dart';
import '../../../constants/custom_text_styles.dart';
import '../../../utils/date_time_utils.dart';
import '../controllers/main_customer_controller.dart';

class ErrorNotificationView extends StatelessWidget {
  final controller = Get.find<MainCustomerController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        _buildNotifications(),
      ],
    );
  }

  Widget _buildNotifications() {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          controller.getIncidents();
        },
        child: AnimationLimiter(
          child: Obx(
            () => ListView.builder(
              itemCount: controller.incidents.length,
              itemBuilder: (BuildContext context, int index) {
                final incident = controller.incidents[index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: ErrorNotificationTile(
                        time: DateTimeUtils.parseToTime(incident.createdAt ?? ''),
                        title: incident.title ?? '',
                        description: incident.description ?? '',
                        isRead: false,
                        date: DateTimeUtils.parseToDate(incident.createdAt ?? ''),
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
