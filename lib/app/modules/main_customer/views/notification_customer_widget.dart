import 'package:express_delivery/app/modules/main_customer/views/system_notifications_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/app_bars/custom_app_bars.dart';
import '../../../components/base/base_screen_view.dart';
import '../../../components/tab_bars/primary_tab_bar.dart';
import '../../../utils/app_strings.dart';
import '../controllers/main_customer_controller.dart';
import 'error_notificaions_view.dart';

class NotificationCustomerWidget extends StatelessWidget {
  final controller = Get.find<MainCustomerController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.CUSTOMER_NOTIFICATION_TEXT.tr,
      ),
      body: BaseScreenView(
        child: Column(
          children: [
            SizedBox(height: 20),
            _buildTabBar(),
            _buildPageView(),
          ],
        ),
      ),
    );
  }

  PrimaryTabBar _buildTabBar() {
    return PrimaryTabBar(
      tabs: [
        _buildTab(
          title: Strings.HISTORIES_TEXT.tr,
        ),
        _buildTab(
          title: Strings.INCIDENTS_TEXT.tr,
        ),
      ],
      controller: controller.tabController,
      onTap: (index) {
        controller.shouldHandlePageChanged = false;
        controller.currentTabIndex = index;
        controller.pageController.animateToPage(
          controller.currentTabIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInCubic,
        );
      },
    );
  }

  Widget _buildPageView() {
    return Expanded(
      child: GestureDetector(
        onPanDown: (_) {
          controller.shouldHandlePageChanged = true;
        },
        child: PageView(
          controller: controller.pageController,
          onPageChanged: (page) {
            if (controller.shouldHandlePageChanged) {
              controller.currentTabIndex = page;
              controller.tabController.animateTo(controller.currentTabIndex,
                  duration: Duration(milliseconds: 500), curve: Curves.easeInCubic);
            }
          },
          children: [
            SystemNotificationView(),
            ErrorNotificationView(),
          ],
        ),
      ),
    );
  }

  Row _buildTab({
    required String title,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: Center(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}