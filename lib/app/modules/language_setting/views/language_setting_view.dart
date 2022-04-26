import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../components/app_bars/custom_app_bars.dart';
import '../../../components/base/base_screen_view.dart';
import '../../../components/systems/system_tile.dart';
import '../../../constants/custom_colors.dart';
import '../../../data/services/language_service.dart';
import '../../../utils/app_strings.dart';
import '../controllers/language_setting_controller.dart';

class LanguageSettingView extends GetView<LanguageSettingController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onBackPressed,
      child: Scaffold(
        appBar: CustomAppBars().primaryAppBar(
          title: Strings.LANGUAGE_TEXT.tr,
        ),
        body: BaseScreenView(
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildVietnameseTile(),
              SizedBox(height: 20),
              _buildEnglishTile(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildVietnameseTile() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: Icon(
                  controller.isVietnameseEnable.isTrue ? Icons.radio_button_checked : Icons.radio_button_off,
                  color: CustomColors.blue178,
                  size: 24,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: SystemTile(
              onTap: () {
                LanguageService().changeLanguage(Strings.VIETNAMESE);
                controller.onInitData();
              },
              title: 'Tiếng Việt',
              icon: Assets.images.imgIconColorCircleVietnam,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildEnglishTile() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: Icon(
                  controller.isEnglishEnable.isTrue ? Icons.radio_button_checked : Icons.radio_button_off,
                  color: CustomColors.blue178,
                  size: 24,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: SystemTile(
              onTap: () {
                LanguageService().changeLanguage(Strings.ENGLISH);
                controller.onInitData();
              },
              title: 'English',
              icon: Assets.images.imgIconColorCircleUk,
            ),
          ),
        ],
      ),
    );
  }
}
