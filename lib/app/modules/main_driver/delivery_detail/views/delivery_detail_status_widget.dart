import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/deliveries/delivery_status.dart';
import '../../../../constants/custom_colors.dart';
import '../../../../constants/custom_text_styles.dart';
import '../../../../utils/app_strings.dart';

class DeliveryDetailStatusWidget extends StatelessWidget {
  final double width;
  final int statusType;
  final Function(int type) onItemStatusClick;

  DeliveryDetailStatusWidget({
    Key? key,
    required this.width,
    required this.onItemStatusClick,
    required this.statusType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: CustomColors.gray214,
          width: 1,
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.DELIVERY_PROGRESS_TEXT.tr,
            style: CustomTextStyles.zeplin8pt().copyWith(
              color: CustomColors.gray78,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 90,
            child: DeliveryStatus(
              onItemStatusClick: onItemStatusClick,
              statusType: statusType,
            ),
          ),
        ],
      ),
    );
  }
}