import 'package:express_delivery/app/components/app_bars/custom_app_bars.dart';
import 'package:express_delivery/app/components/base/base_screen_view.dart';
import 'package:express_delivery/app/components/tab_bars/secondary_tab_bar.dart';
import 'package:express_delivery/app/modules/main_driver/controllers/main_driver_controller.dart';
import 'package:express_delivery/app/modules/main_driver/views/delivery_unconfirmed_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/tab_bars/primary_tab_bar.dart';
import '../../../utils/app_strings.dart';
import 'delivery_confirmed_widget.dart';
import 'delivery_in_transit_widget.dart';

class DeliveryDriverWidget extends GetView<MainDriverController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.DELIVERY_TEXT.tr,
      ),
      body: BaseScreenView(
        child: Column(
          children: [
            _buildTabBar(),
            _buildPageView(),
          ],
        ),
      ),
    );
  }

  SecondaryTabBar _buildTabBar() {
    return SecondaryTabBar(
      tabs: [
        _buildTab(
          title: Strings.UNCONFIRMED_DELIVERY_TEXT.tr,
        ),
        _buildTab(
          title: Strings.CONFIRMED_DELIVERY_TEXT.tr,
        ),
        _buildTab(
          title: Strings.IN_TRANSIT_DELIVERY_TEXT.tr,
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
            DeliveryUnconfirmedWidget(),
            DeliveryConfirmedWidget(),
            DeliveryInTransitWidget(),
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
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
