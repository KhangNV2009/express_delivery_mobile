import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/custom_colors.dart';
import '../../constants/custom_shadows.dart';
import '../../constants/custom_text_styles.dart';
import '../../utils/app_strings.dart';
import '../../utils/date_time_utils.dart';

class DeliveryTile extends StatelessWidget {
  final VoidCallback onDetailClick;
  final int statusType;
  final int id;
  final String address;
  final String date;

  DeliveryTile({
    Key? key,
    required this.id,
    required this.onDetailClick,
    required this.statusType,
    required this.address,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 11,
              horizontal: 14,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: CustomShadows.primaryShadow(),
              borderRadius: BorderRadius.circular(14),
            ),
            width: Get.width,
            height: 120,
            child: Stack(
              children: [
                Row(
                  children: [
                    SizedBox(width: 8),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: getStatusImage().image(
                          height: 66,
                          width: 66,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 6,
                      child: Container(
                        child: Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(14),
                            ),
                            onTap: onDetailClick,
                            child: Container(
                              margin: EdgeInsets.only(
                                left: 10,
                                right: 18,
                                top: 18,
                                bottom: 18,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${Strings.ORDER_TEXT.tr}: $id',
                                    style: CustomTextStyles.zeplin8pt().copyWith(
                                      color: CustomColors.blue178,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  _buildAddress(),
                                  _buildDate()
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildAddress() {
    return Container(
      margin: EdgeInsets.only(top: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              FontAwesomeIcons.locationPin,
              color: CustomColors.blue178,
              size: 13,
            ),
          ),
          Expanded(
            flex: 18,
            child: Container(
              margin: EdgeInsets.only(left: 4),
              child: Text(
                address,
                style: CustomTextStyles.zeplin7pt().copyWith(
                  color: CustomColors.gray78,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDate() {
    return Container(
      margin: EdgeInsets.only(top: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Assets.images.imgIconOutlineCalendar.image(
              height: 13,
              width: 13,
            ),
          ),
          Expanded(
            flex: 18,
            child: Container(
              margin: EdgeInsets.only(left: 4),
              child: Text(
                getTime(),
                style: CustomTextStyles.zeplin7pt().copyWith(
                  color: CustomColors.gray161,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getTime() {
    return DateTimeUtils.parseToDateTime(date);
  }

  AssetGenImage getStatusImage() {
    switch (statusType) {
      case 2:
        return Assets.images.imgIconColorCircleDeliveryUnconfirmed;
      case 3:
        return Assets.images.imgIconColorCircleDeliveryConfirmed;
      case 4:
        return Assets.images.imgIconColorCircleDeliveryInProgress;
      default:
        return Assets.images.imgIconColorCircleDeliveryConfirmed;
    }
  }
}
