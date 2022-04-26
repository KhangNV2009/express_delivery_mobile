import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../../../gen/assets.gen.dart';
import '../../../components/app_bars/custom_app_bars.dart';
import '../../../components/base/base_screen_view.dart';
import '../../../components/systems/system_tile.dart';
import '../../../constants/custom_colors.dart';
import '../../../constants/custom_text_styles.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/app_strings.dart';
import '../controllers/main_customer_controller.dart';

class MoreCustomerWidget extends GetView<MainCustomerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.CUSTOMER_MORE_TEXT.tr,
      ),
      body: BaseScreenView(
        child: Column(
          children: [
            _buildTags(),
            SizedBox(height: 170),
            _buildLogoutButton(),
            SizedBox(height: 60),
            _buildVersionInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildTags() {
    final tags = <Tuple3<AssetGenImage, String, VoidCallback>>[
      Tuple3(
        Assets.images.imgIconColorCircleAccountInfo,
        Strings.ACCOUNT_INFO_TEXT.tr,
        () {
          Get.toNamed(Routes.CUSTOMER_ACCOUNT_INFO);
        },
      ),
      Tuple3(
        Assets.images.imgIconColorCircleSetting,
        Strings.SETTING_TEXT.tr,
        () {
          Get.toNamed(Routes.CUSTOMER_SETTING);
        },
      ),
    ];

    return Expanded(
      child: AnimationLimiter(
        child: ListView.builder(
          itemCount: tags.length,
          itemBuilder: (BuildContext context, int index) {
            final tag = tags[index];
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: SystemTile(
                      onTap: () {
                        tag.item3.call();
                      },
                      title: tag.item2,
                      icon: tag.item1,
                    ),
                  ),
                ),
              ),
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

  Container _buildVersionInfo() {
    return Container(
      child: Obx(
            () => Text(
          '${Strings.VERSION_INFO_TEXT.tr} ${controller.version}',
          style: CustomTextStyles.zeplin7pt().copyWith(
            color: CustomColors.gray78,
          ),
        ),
      ),
    );
  }
}
