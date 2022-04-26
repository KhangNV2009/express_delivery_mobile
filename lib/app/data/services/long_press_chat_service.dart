import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';
import '../../utils/app_strings.dart';

class LongPressChatService extends GetxService {
  final longPressOverlayVisible = false.obs;
  final Rxn<Widget> child = Rxn<Widget>();
  final positionY = 0.0.obs;
  final isCurrent = false.obs;
  VoidCallback? onCopyCallback;

  @override
  void onInit() {
    super.onInit();
    longPressOverlayVisible.listen((visible) {
      if (visible) {
        _showLoadingOverlay();
      } else {
        Get.back();
      }
    });
  }

  void _showLoadingOverlay() {
    showModal(
      context: Get.context!,
      builder: (context) {
        return SafeArea(
          child: Container(
            color: Colors.transparent,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  longPressOverlayVisible.value = false;
                },
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  color: Colors.black12,
                  child: Stack(
                    children: [
                      Obx(
                        () => Positioned(
                          right: isCurrent.isTrue ? 0 : null,
                          left: isCurrent.isFalse ? 0 : null,
                          top: positionY.value -
                              (kToolbarHeight - (kMinInteractiveDimension / 2)) -
                              ((!_isBottom()) ? 74 : 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: isCurrent.isTrue
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              (!_isBottom()) ? _buildActionContainer() : SizedBox(),
                              (!_isBottom()) ? SizedBox(height: 10) : SizedBox(),
                              child.value ?? SizedBox(),
                              _isBottom() ? SizedBox(height: 10) : SizedBox(),
                              _isBottom() ? _buildActionContainer() : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Container _buildActionContainer() {
    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: 14),
      margin: EdgeInsets.only(
        right: isCurrent.isTrue ? 14 : 0,
        left: isCurrent.isFalse ? 64 : 0,
      ),
      width: Get.width - (Get.width / 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onCopyCallback,
              child: _buildAction(
                title: Strings.COPY_TEXT.tr,
                icon: FontAwesomeIcons.copy,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isBottom() {
    return positionY.value < (Get.height * 2 / 3);
  }

  Column _buildAction({
    required IconData icon,
    required String title,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20),
        SizedBox(height: 12),
        Text(
          title,
          style: CustomTextStyles.zeplin7pt().copyWith(
            color: CustomColors.gray78,
          ),
        ),
      ],
    );
  }
}

class LongPressChatUtils {
  void showOverlayVisible({
    required Widget child,
    required double positionY,
    required bool isCurrent,
    required VoidCallback onCopyCallback,
    required VoidCallback? onEditCallback,
  }) {
    final _controller = Get.find<LongPressChatService>();
    _controller.longPressOverlayVisible.value = true;
    _controller.child.value = child;
    _controller.positionY.value = positionY;
    _controller.isCurrent.value = isCurrent;
    _controller.onCopyCallback = onCopyCallback;
  }

  void hideOverlay() {
    final _controller = Get.find<LongPressChatService>();
    _controller.longPressOverlayVisible.value = false;
  }
}
