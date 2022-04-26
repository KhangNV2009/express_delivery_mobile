import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../components/app_bars/custom_app_bars.dart';
import '../../../../components/base/base_screen_view.dart';
import '../../../../components/detail_tiles/detail_tile.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_strings.dart';
import '../controllers/customer_setting_controller.dart';

class CustomerSettingView extends GetView<CustomerSettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.SETTING_TEXT.tr,
      ),
      body: BaseScreenView(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildSettingTiles(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildSettingTiles() {
    final tiles = <Tuple3<String, AssetGenImage, VoidCallback>>[
      Tuple3(
        Strings.LANGUAGE_TEXT.tr,
        Assets.images.imgIconColorCircleLanguages,
        () {
          Get.toNamed(Routes.LANGUAGE_SETTING);
        },
      ),
      Tuple3(
        Strings.TERMS_OF_USE_TEXT.tr,
        Assets.images.imgIconColorCircleCondition,
        () {},
      ),
      Tuple3(
        Strings.ABOUT_EXPRESS_DELIVERY_TEXT.tr,
        Assets.images.imgIconColorCircleInfo,
        () {
          launchURL('https://www.google.com/');
        },
      ),
    ];

    return Container(
      child: AnimationLimiter(
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tiles.length,
          itemBuilder: (BuildContext context, int index) {
            final item = tiles[index];
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: DetailTile(
                    isFirst: false,
                    title: item.item1,
                    icon: item.item2,
                    onTap: () {
                      item.item3.call();
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  static void launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
