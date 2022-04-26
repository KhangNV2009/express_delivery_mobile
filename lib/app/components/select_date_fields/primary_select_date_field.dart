import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';

class PrimarySelectDateField extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onTap;

  PrimarySelectDateField({
    Key? key,
    required this.title,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomTextStyles.zeplin7pt().copyWith(
              color: CustomColors.gray78,
            ),
          ),
          SizedBox(height: 7),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  width: 0.5,
                  color: CustomColors.gray214,
                ),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Text(
                      content,
                      style: CustomTextStyles.zeplin8pt().copyWith(
                        color: CustomColors.gray78,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Assets.images.imgIconOutlineCalendar.image(
                      height: 16,
                      width: 16,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
