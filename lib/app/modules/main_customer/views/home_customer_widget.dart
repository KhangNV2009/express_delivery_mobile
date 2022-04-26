import 'package:express_delivery/app/modules/main_customer/controllers/main_customer_controller.dart';
import 'package:express_delivery/app/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../../../gen/assets.gen.dart';
import '../../../components/base/base_screen_view.dart';
import '../../../components/systems/system_tile.dart';
import '../../../constants/core_remote_constants.dart';
import '../../../constants/custom_colors.dart';
import '../../../constants/custom_text_styles.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/app_strings.dart';

class HomeCustomerWidget extends GetWidget<MainCustomerController> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenView(
      backgroundColor: CustomColors.blue178,
      child: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
        child: Column(
          children: [
            _buildGreeting(),
            _buildAction(),
          ],
        ),
      ),
    );
  }

  Widget _buildGreeting() {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomColors.blue236,
            CustomColors.blue178,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.HELLO_TEXT.tr,
                style: CustomTextStyles.zeplin12p5pt().copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Obx(
                () => Text(
                  controller.userModel.value?.fullName ?? '',
                  style: CustomTextStyles.zeplin10pt().copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {
                    controller.changeTabIndex(3);
                  },
                  child: ImageUtils().loadImageUrl(
                    blurHash: '',
                    imageUrl: '${CoreRemoteConstants.baseImageUrl}'
                        '${controller.userModel.value?.avatar}',
                    width: 50,
                    height: 50,
                    boxFit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAction() {
    final tags = <Tuple3<AssetGenImage, String, VoidCallback>>[
      Tuple3(
        Assets.images.imgIconCircleColorWarehouse,
        Strings.WAREHOUSE_MANAGEMENT_TEXT.tr,
        () {
          Get.toNamed(Routes.WAREHOUSE);
        },
      ),
      Tuple3(
        Assets.images.imgIconCircleColorTruck,
        Strings.BOOK_TRUCK_TEXT.tr,
        () {
          Get.toNamed(Routes.BOOK_TRUCK);
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
}
