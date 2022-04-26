import 'package:express_delivery/app/modules/main_driver/controllers/main_driver_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../../../gen/assets.gen.dart';
import '../../../components/app_bars/custom_app_bars.dart';
import '../../../components/base/base_screen_view.dart';
import '../../../components/detail_tiles/detail_tile.dart';
import '../../../constants/custom_colors.dart';
import '../../../constants/custom_text_styles.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/app_strings.dart';

class ProfileDriverWidget extends GetView<MainDriverController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.ACCOUNT_INFO_TEXT.tr,
      ),
      body: BaseScreenView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildTiles(),
            _buildLogoutButton(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Container _buildTiles() {
    final tiles = <Tuple3<String, AssetGenImage, VoidCallback>>[
      Tuple3(
        Strings.ACCOUNT_INFO_TEXT.tr,
        Assets.images.imgIconColorCircleProfile,
        () {
          Get.toNamed(Routes.DRIVER_PROFILE);
        },
      ),
      Tuple3(
        Strings.CHANGE_PASSWORD_TEXT.tr,
        Assets.images.imgIconColorCircleLock,
        () {
          Get.toNamed(Routes.CUSTOMER_CHANGE_PASSWORD);
        },
      ),
    ];

    return Container(
      child: Expanded(
        child: ListView.builder(
          itemCount: tiles.length,
          itemBuilder: (BuildContext context, int index) {
            var tile = tiles[index];
            return DetailTile(
              title: tile.item1,
              icon: tile.item2,
              onTap: () {
                tile.item3.call();
              },
              isFirst: (index == 0),
            );
          },
        ),
      ),
    );
  }

  Container _buildLogoutButton() {
    return Container(
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: controller.logout,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                FontAwesomeIcons.arrowRightFromBracket,
                size: 30,
                color: CustomColors.red67,
              ),
              SizedBox(width: 15),
              Text(
                Strings.LOG_OUT_TEXT.tr,
                style: CustomTextStyles.zeplin8p5pt().copyWith(
                  color: CustomColors.red67,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
