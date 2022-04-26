import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/custom_colors.dart';
import '../../../constants/custom_text_styles.dart';
import '../../../utils/date_time_utils.dart';
import '../../../utils/image_utils.dart';

class PartnerChatContainer extends StatelessWidget {
  final String name;
  final String avatar;
  final Widget child;
  final VoidCallback? onLongPress;
  final String time;

  PartnerChatContainer({
    Key? key,
    required this.name,
    required this.avatar,
    required this.child,
    required this.onLongPress,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 6,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(17.5),
            child: ImageUtils().loadImageUrl(
              imageUrl: avatar,
              width: 35,
              height: 35,
              blurHash: '',
            ),
          ),
          SizedBox(width: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: CustomColors.gray167),
                  color: Colors.white,
                ),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onLongPress: onLongPress,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    name,
                                    style: CustomTextStyles.zeplin8pt().copyWith(
                                      color: CustomColors.gray78,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: Get.width - 140,
                                ),
                                child: child,
                              ),
                              SizedBox(height: 6),
                            ],
                          ),
                          Text(
                            getTime(),
                            style: CustomTextStyles.zeplin6p5pt().copyWith(
                              color: CustomColors.gray161,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 14),
            ],
          ),
        ],
      ),
    );
  }

  String getTime() {
    return DateTimeUtils.parseToTime(time);
  }
}
