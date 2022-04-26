import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/custom_colors.dart';
import '../../constants/custom_shadows.dart';
import '../../constants/custom_text_styles.dart';
import '../../utils/app_strings.dart';

class ErrorNotificationTile extends StatelessWidget {
  final VoidCallback onTap;
  final bool isRead;
  final String title;
  final String description;
  final String date;
  final String time;

  ErrorNotificationTile({
    Key? key,
    required this.onTap,
    required this.isRead,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      width: Get.width,
      decoration: BoxDecoration(
        color: isRead ? CustomColors.white255 : Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: CustomShadows.primaryShadow(),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: isRead
                      ? Assets.images.imgIconColorCircleTroubleUnread.image(
                    height: 30,
                    width: 30,
                  )
                      : Assets.images.imgIconColorCircleTroubleRead.image(
                    height: 30,
                    width: 30,
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    margin: EdgeInsets.only(left: 9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: CustomTextStyles.zeplin8pt().copyWith(
                            color: CustomColors.gray87,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          description,
                          style: CustomTextStyles.zeplin7pt().copyWith(
                            color: CustomColors.gray87,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '$date ${Strings.TIME_AT_TEXT.tr} $time',
                          style: CustomTextStyles.zeplin6pt().copyWith(
                            color: CustomColors.gray161,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}