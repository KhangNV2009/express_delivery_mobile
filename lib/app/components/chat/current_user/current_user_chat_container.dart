import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/custom_colors.dart';
import '../../../constants/custom_text_styles.dart';
import '../../../utils/date_time_utils.dart';

class CurrentUserChatContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onLongPress;
  final String time;

  CurrentUserChatContainer({
    Key? key,
    required this.child,
    required this.onLongPress,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CustomColors.blue255,
          ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onLongPress: onLongPress,
              child: Container(
                padding: EdgeInsets.all(6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: Get.width - 100,
                      ),
                      child: child,
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          getTime(),
                          style: CustomTextStyles.zeplin6p5pt().copyWith(
                            color: CustomColors.gray161,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getTime() {
    return DateTimeUtils.parseToTime(time);
  }
}
