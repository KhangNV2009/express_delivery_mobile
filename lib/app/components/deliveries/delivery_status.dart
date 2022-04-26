import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';
import '../../utils/app_strings.dart';

class DeliveryStatus extends StatelessWidget {
  final Function(int type) onItemStatusClick;
  final int statusType;

  DeliveryStatus({
    Key? key,
    required this.onItemStatusClick,
    required this.statusType,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.white255o97,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 16,
              ),
              child: DottedLine(
                lineThickness: 2,
                dashColor: CustomColors.gray214,
              ),
            ),
          ),
          Row(
            children: [
              _buildJobStatusType(
                image: Assets.images.imgIconColorCircleDeliveryUnconfirmed,
                isEnable: statusType == 2 ? true : false,
                type: 2,
                title: Strings.UNCONFIRMED_DELIVERY_TEXT.tr,
              ),
              _buildJobStatusType(
                image: Assets.images.imgIconColorCircleDeliveryConfirmed,
                isEnable: statusType == 3 ? true : false,
                type: 3,
                title: Strings.CONFIRMED_DELIVERY_TEXT.tr,
              ),
              _buildJobStatusType(
                image: Assets.images.imgIconColorCircleDeliveryInProgress,
                isEnable: statusType == 4 ? true : false,
                type: 4,
                title: Strings.IN_TRANSIT_DELIVERY_TEXT.tr,
              ),
              _buildJobStatusType(
                image: Assets.images.imgIconColorCircleDeliverySuccess,
                isEnable: statusType == 5 ? true : false,
                type: 5,
                title: Strings.SUCCESS_DELIVERY_TEXT.tr,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _buildJobStatusType({
    required bool isEnable,
    required AssetGenImage image,
    required int type,
    required String title,
  }) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: isEnable ? null : EdgeInsets.only(bottom: 20),
            child: Material(
              type: MaterialType.transparency,
              child: InkResponse(
                onTap: () {
                  onItemStatusClick(type);
                },
                child: Stack(
                  children: [
                    image.image(
                      height: isEnable ? 56 : 42,
                      width: isEnable ? 56 : 42,
                    ),
                    isEnable
                        ? SizedBox()
                        : Positioned.fill(
                      child: Container(
                        color: Colors.white38,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          isEnable
              ? Container(
            margin: EdgeInsets.only(top: 6),
            child: Text(
              title,
              style: CustomTextStyles.zeplin6pt().copyWith(
                color: CustomColors.gray78,
              ),
              textAlign: TextAlign.center,
            ),
          )
              : SizedBox()
        ],
      ),
    );
  }
}