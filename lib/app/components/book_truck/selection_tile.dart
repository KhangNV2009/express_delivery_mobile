import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';

class SelectionTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isEnable;

  SelectionTile({
    Key? key,
    required this.title,
    required this.onTap,
    required this.isEnable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isEnable
                        ? Assets.images.imgIconCircleCompleted.image(
                            height: 20,
                            width: 20,
                          )
                        : Assets.images.imgIconCricleQuestion.image(
                            height: 20,
                            width: 20,
                          ),
                    SizedBox(width: 10),
                    Text(
                      title,
                      style: CustomTextStyles.zeplin8pt().copyWith(
                        color: CustomColors.gray78,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.chevron_right_rounded,
                  size: 26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
