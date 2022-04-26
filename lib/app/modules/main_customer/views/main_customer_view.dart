import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../constants/custom_colors.dart';
import '../../../utils/app_strings.dart';
import '../controllers/main_customer_controller.dart';

class MainCustomerView extends GetView<MainCustomerController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.tabIndex.value,
            children: controller.listScreens,
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: CustomColors.blue178,
            unselectedItemColor: CustomColors.gray87,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                label: Strings.CUSTOMER_HOME_TEXT.tr,
                icon: _buildIcon(FontAwesomeIcons.houseChimneyWindow),
                activeIcon: _buildIcon(FontAwesomeIcons.houseChimneyWindow),
              ),
              BottomNavigationBarItem(
                label: Strings.CUSTOMER_CHAT_TEXT.tr,
                icon: _buildIcon(FontAwesomeIcons.solidComment),
                activeIcon: _buildIcon(FontAwesomeIcons.solidComment),
              ),
              BottomNavigationBarItem(
                label: Strings.CUSTOMER_NOTIFICATION_TEXT.tr,
                icon: _buildIcon(FontAwesomeIcons.solidBell),
                activeIcon: _buildIcon(FontAwesomeIcons.solidBell),
              ),
              BottomNavigationBarItem(
                label: Strings.CUSTOMER_MORE_TEXT.tr,
                icon: _buildIcon(FontAwesomeIcons.userGear),
                activeIcon: _buildIcon(FontAwesomeIcons.userGear),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    bool isBack = false;
    if (controller.clickedLastTime == null) {
      controller.clickedLastTime = DateTime.now();
    } else {
      var now = DateTime.now();
      var diff = now.difference(controller.clickedLastTime!);
      controller.clickedLastTime = now;
      isBack = diff.inMilliseconds < 1500;
    }
    if (!isBack) {
      ///Handle show toast press back again here
    }
    return isBack;
  }

  Widget _buildIcon(IconData icon) {
    return Icon(
      icon,
      size: 27,
    );
  }
}
