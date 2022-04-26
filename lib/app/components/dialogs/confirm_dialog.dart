import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../gen/assets.gen.dart';
import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';
import '../../utils/app_strings.dart';
import '../buttons/custom_buttons.dart';

class ConfirmDialog extends StatelessWidget {
  final AssetGenImage icon;
  final String title;
  final Widget child;
  final VoidCallback onCancelTap;
  final VoidCallback onConfirmTap;
  final String? confirmTapText;

  ConfirmDialog({
    Key? key,
    required this.icon,
    required this.title,
    required this.child,
    required this.onCancelTap,
    required this.onConfirmTap,
    this.confirmTapText,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon.image(
              height: 54,
              width: 54,
            ),
            SizedBox(height: 17),
            Text(
              title,
              style: CustomTextStyles.zeplin10pt().copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            child,
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: CustomButtons().outlineButton(
                    outlineColor: CustomColors.gray167,
                    borderRadius: 5,
                    height: 30,
                    onTap: onCancelTap,
                    backgroundColor: Colors.white,
                    text: Text(
                      Strings.CANCEL_TEXT.tr.toUpperCase(),
                      style: CustomTextStyles.zeplin7p5pt().copyWith(
                        color: CustomColors.gray167,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: CustomButtons().colorButton(
                    borderRadius: 5,
                    height: 30,
                    onTap: onConfirmTap,
                    backgroundColor: CustomColors.blue178,
                    text: Text(
                      confirmTapText == null
                          ? Strings.CONFIRM_TEXT.tr.toUpperCase()
                          : confirmTapText?.toUpperCase() ?? '',
                      style: CustomTextStyles.zeplin7p5pt().copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
