import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../components/app_bars/custom_app_bars.dart';
import '../../../../components/base/base_screen_view.dart';
import '../../../../components/detail_tiles/detail_tile.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_strings.dart';
import '../controllers/customer_account_info_controller.dart';

class CustomerAccountInfoView extends GetView<CustomerAccountInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.ACCOUNT_INFO_TEXT.tr,
      ),
      body: BaseScreenView(
        child: Container(
          child: _buildTiles(),
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
          Get.toNamed(Routes.CUSTOMER_PROFILE);
        },
      ),
      Tuple3(
        Strings.CHANGE_PASSWORD_TEXT.tr,
        Assets.images.imgIconColorCircleLock,
        () {
          Get.toNamed(Routes.CUSTOMER_CHANGE_PASSWORD);
        },
      ),
      Tuple3(
        Strings.CHANGE_LOCATION_TEXT.tr,
        Assets.images.imgIconColorCirclePosition,
        () {
          Get.toNamed(Routes.SELECT_LOCATION);
        },
      ),
    ];

    return Container(
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
    );
  }
}
