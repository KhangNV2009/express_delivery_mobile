import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';
import '../../utils/app_strings.dart';

class MediaPickerDialog extends StatelessWidget {
  final VoidCallback onPickImageFromCamera;
  final VoidCallback onPickImageFromGallery;
  final VoidCallback onPickVideoFromCamera;
  final VoidCallback onPickVideoFromGallery;

  MediaPickerDialog({
    Key? key,
    required this.onPickImageFromCamera,
    required this.onPickImageFromGallery,
    required this.onPickVideoFromCamera,
    required this.onPickVideoFromGallery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: (1),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          _buildPicker(
            Icons.camera_alt_outlined,
            Strings.TAKE_PHOTO_FROM_CAMERA_TEXT.tr,
            onPickImageFromCamera,
          ),
          _buildPicker(
            Icons.image_outlined,
            Strings.TAKE_PHOTO_FROM_GALLERY_TEXT.tr,
            onPickImageFromGallery,
          ),
          _buildPicker(
            Icons.videocam_outlined,
            Strings.MAKE_VIDEO_FROM_CAMERA_TEXT.tr,
            onPickVideoFromCamera,
          ),
          _buildPicker(
            Icons.video_collection_outlined,
            Strings.SELECT_VIDEO_FROM_GALLERY.tr,
            onPickVideoFromGallery,
          ),
        ],
      ),
    );
  }

  Container _buildPicker(
    IconData icon,
    String text,
    VoidCallback onTap,
  ) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: CustomColors.blue178,
                size: 36,
              ),
              SizedBox(height: 4),
              Container(
                height: 34,
                child: Text(
                  text,
                  style: CustomTextStyles.zeplin7pt().copyWith(
                    color: CustomColors.gray78,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
