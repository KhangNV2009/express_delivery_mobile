import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../components/buttons/custom_buttons.dart';
import '../../../components/notification/system_notification_tile.dart';
import '../../../constants/custom_colors.dart';
import '../../../constants/custom_text_styles.dart';
import '../../../utils/date_time_utils.dart';
import '../controllers/main_customer_controller.dart';

class SystemNotificationView extends GetView<MainCustomerController> {
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
          controller.getHistories();
        },
        child: AnimationLimiter(
          child: Obx(
            () => ListView.builder(
              itemCount: controller.histories.length,
              itemBuilder: (BuildContext context, int index) {
                final history = controller.histories[index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: SystemNotificationTile(
                        time: DateTimeUtils.parseToTime(history.createdAt ?? ''),
                        title: history.title ?? '',
                        description: history.description ?? '',
                        isRead: false,
                        date: DateTimeUtils.parseToDate(history.createdAt ?? ''),
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
