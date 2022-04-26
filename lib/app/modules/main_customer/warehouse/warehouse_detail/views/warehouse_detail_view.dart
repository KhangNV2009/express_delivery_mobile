import 'dart:convert';

import 'package:express_delivery/app/components/app_bars/custom_app_bars.dart';
import 'package:express_delivery/app/components/base/base_screen_view.dart';
import 'package:express_delivery/app/modules/main_customer/warehouse/warehouse_detail/views/in_transit_widget.dart';
import 'package:express_delivery/app/modules/main_customer/warehouse/warehouse_detail/views/ship_success_widget.dart';
import 'package:express_delivery/app/modules/main_customer/warehouse/warehouse_detail/views/wait_confirm_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../components/tab_bars/secondary_tab_bar.dart';
import '../../../../../constants/custom_text_styles.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../utils/app_strings.dart';
import '../controllers/warehouse_detail_controller.dart';
import 'confirmed_widget.dart';

class WarehouseDetailView extends GetView<WarehouseDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.WAREHOUSE_DETAIL_TEXT.tr,
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, String> parameters = {};
              parameters['warehouse_model'] = jsonEncode(controller.warehouse.value.toJson());
              Get.toNamed(
                Routes.WAREHOUSE_EDIT,
                parameters: parameters,
              );
            },
            icon: Icon(FontAwesomeIcons.solidPenToSquare),
          ),
        ],
      ),
      body: BaseScreenView(
        child: Column(
          children: [
            _buildAddressText(),
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
          title: 'Wait for confirm',
        ),
        _buildTab(
          title: 'Confirmed',
        ),
        _buildTab(
          title: 'In transit',
        ),
        _buildTab(
          title: 'Shipping Successful',
        ),
      ],
      controller: controller.tabController,
      onTap: (index) {
        controller.shouldHandlePageChanged = false;
        controller.currentTabIndex = index;
        controller.pageController.animateToPage(
          controller.currentTabIndex,
          duration: Duration(milliseconds: 300),
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
              controller.tabController.animateTo(
                controller.currentTabIndex,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInCubic,
              );
            }
          },
          children: [
            WaitConfirmWidget(),
            ConfirmedWidget(),
            InTransitWidget(),
            ShipSuccessWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildTab({
    required String title,
  }) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _buildAddressText() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Text(
              'Warehouse name: ${controller.warehouse.value.name}',
              style: CustomTextStyles.zeplin8pt().copyWith(
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Address',
            style: CustomTextStyles.zeplin8pt().copyWith(
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Obx(
              () => Text(
                '${controller.warehouse.value.location?.street} '
                '${controller.warehouse.value.location?.district}, '
                '${controller.warehouse.value.location?.city}',
                maxLines: 3,
                style: CustomTextStyles.zeplin8pt().copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
