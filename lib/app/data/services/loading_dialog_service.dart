import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../components/custom_modal_configuration.dart';
import '../../constants/custom_colors.dart';
import '../../utils/logger_service.dart';

class LoadingDialogService extends GetxService {
  final loadingOverlayVisible = false.obs;
  bool _modalVisible = false;

  @override
  void onInit() {
    super.onInit();
    LoggerService.log.i('onInit loading dialogs service');
    loadingOverlayVisible.listen((visible) {
      if (visible) {
        _showLoadingOverlay();
      } else {
        if (_modalVisible) {
          Get.back();
        }
      }
    });
  }

  void _showLoadingOverlay() {
    _modalVisible = true;
    showModal(
        context: Get.context!,
        configuration:
            const BlurFadeScaleTransitionConfiguration(barrierDismissible: false, blurSigma: 6.0),
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            content: WillPopScope(
              onWillPop: () async => false,
              child: Container(
                width: 175,
                height: 175,
                child: SpinKitDoubleBounce(
                  color: CustomColors.blue178,
                  size: 100,
                ),
              ),
            ),
          );
        }).then((value) {
      _modalVisible = false;
    });
  }
}

class LoadingDialogUtils {
  void loadingOverlayVisible({required bool visible}) {
    if (visible) {
      Get.find<LoadingDialogService>().loadingOverlayVisible.value = true;
    } else {
      Get.find<LoadingDialogService>().loadingOverlayVisible.value = false;
    }
  }
}
