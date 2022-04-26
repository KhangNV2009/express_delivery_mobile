import 'package:animations/animations.dart';
import 'package:express_delivery/app/components/dialogs/sf_date_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';
import '../../utils/app_strings.dart';
import '../custom_modal_configuration.dart';
import 'confirm_dialog.dart';
import 'media_picker_dialog.dart';
import 'notify_dialog.dart';

class CustomDialogs {
  void _showModelDialog({
    required Widget child,
    required bool barrierDismissible,
  }) {
    showModal<bool>(
      context: Get.context!,
      configuration: BlurFadeScaleTransitionConfiguration(
        barrierDismissible: barrierDismissible,
        blurSigma: 6.0,
      ),
      builder: (context) {
        return child;
      },
    );
  }

  void errorDialog({
    required VoidCallback onTap,
    required String description,
  }) {
    _showModelDialog(
      child: NotifyDialog(
        icon: Assets.images.imgIconDialogError,
        description: description,
        title: 'Lỗi',
        onTap: onTap,
      ),
      barrierDismissible: true,
    );
  }

  void alertDialog({
    required VoidCallback onTap,
    required String description,
  }) {
    _showModelDialog(
      child: NotifyDialog(
        icon: Assets.images.imgIconDialogAlert,
        description: description,
        title: 'Thông báo',
        onTap: onTap,
      ),
      barrierDismissible: true,
    );
  }

  void confirmRemoveGroupDialog({
    required VoidCallback onCancelTap,
    required VoidCallback onConfirmTap,
  }) {
    _showModelDialog(
      child: ConfirmDialog(
        icon: Assets.images.imgIconDialogRemove,
        title: Strings.CONFIRM_REMOVE_TEXT.tr,
        onCancelTap: onCancelTap,
        onConfirmTap: onConfirmTap,
        child: RichText(
          text: TextSpan(
            text: '',
            style: CustomTextStyles.zeplin8pt().copyWith(color: CustomColors.gray78),
            children: [
              TextSpan(
                text: Strings.THIS_ACTION_CAN_NOT_BE_UNDONE_TEXT.tr,
                style: CustomTextStyles.zeplin8pt().copyWith(
                  color: CustomColors.gray78,
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  void datePickerDialog({
    required Function(DateTime) onDateTimeChanged,
    required VoidCallback onConfirmTap,
    required VoidCallback onCancelTap,
  }) {
    _showModelDialog(
      child: SfDatePickerDialog(
        onDateChanged: onDateTimeChanged,
        onConfirmTap: onConfirmTap,
        onCancelTap: onCancelTap,
      ),
      barrierDismissible: true,
    );
  }

  void mediaPickerDialog({
    required VoidCallback onPickImageFromCamera,
    required VoidCallback onPickImageFromGallery,
    required VoidCallback onPickVideoFromCamera,
    required VoidCallback onPickVideoFromGallery,
  }) {
    _showModelDialog(
      child: MediaPickerDialog(
        onPickImageFromCamera: onPickImageFromCamera,
        onPickImageFromGallery: onPickImageFromGallery,
        onPickVideoFromCamera: onPickVideoFromCamera,
        onPickVideoFromGallery: onPickVideoFromGallery,
      ),
      barrierDismissible: true,
    );
  }

  void showChangeAvatarDialog({
    required VoidCallback onCameraPick,
    required VoidCallback onGalleryPick,
  }) {
    _showModelDialog(
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Assets.images.imgSmiley.image(
                  width: 50.0,
                  height: 50.0,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  'Ảnh đại diện',
                  style: CustomTextStyles.zeplin8pt().copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Column(
                children: [
                  InkWell(
                    onTap: onCameraPick,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            color: CustomColors.blue178,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: Text(
                              'Chụp ảnh',
                              style: CustomTextStyles.zeplin8pt().copyWith(
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: onGalleryPick,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.images,
                            color: CustomColors.blue178,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: Text(
                              'Chọn từ thư viện',
                              style: CustomTextStyles.zeplin8pt().copyWith(
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}
