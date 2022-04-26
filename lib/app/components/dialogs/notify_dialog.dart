import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';
import '../buttons/custom_buttons.dart';

class NotifyDialog extends StatelessWidget {
  final AssetGenImage icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  NotifyDialog({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
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
            Text(
              description,
              style: CustomTextStyles.zeplin8pt().copyWith(
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            CustomButtons().colorButton(
              onTap: onTap,
              backgroundColor: CustomColors.blue178,
              text: Text(
                'OK',
                style: CustomTextStyles.zeplin8pt().copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
