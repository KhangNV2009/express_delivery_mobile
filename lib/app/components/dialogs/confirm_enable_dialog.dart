import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';
import '../buttons/custom_buttons.dart';


class ConfirmEnableDialog extends StatelessWidget {
  final AssetGenImage icon;
  final String title;
  final Widget child;
  final VoidCallback onCancelTap;
  final VoidCallback onConfirmTap;
  final String? confirmTapText;
  final bool isConfirmEnable;

  ConfirmEnableDialog({
    Key? key,
    required this.icon,
    required this.title,
    required this.child,
    required this.onCancelTap,
    required this.onConfirmTap,
    required this.isConfirmEnable,
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
                      'Hủy'.toUpperCase(),
                      style: CustomTextStyles.zeplin7p5pt().copyWith(
                        color: CustomColors.gray167,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: CustomButtons().colorEnableButton(
                    isEnable: isConfirmEnable,
                    borderRadius: 5,
                    height: 30,
                    onTap: onConfirmTap,
                    enableBackgroundColor: CustomColors.blue178,
                    disableBackgroundColor: CustomColors.gray97,
                    text: Text(
                      confirmTapText == null
                          ? 'Xác nhận'.toUpperCase()
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