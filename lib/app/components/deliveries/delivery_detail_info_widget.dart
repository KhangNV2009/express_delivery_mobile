import 'package:express_delivery/app/utils/map_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';
import '../../utils/app_strings.dart';

class DeliveryDetailInfoWidget extends StatelessWidget {
  final String title;
  final String fromAddress;
  final LatLng fromLatLng;
  final String toAddress;
  final LatLng toLatLng;
  final String date;

  DeliveryDetailInfoWidget({
    Key? key,
    required this.title,
    required this.fromAddress,
    required this.fromLatLng,
    required this.toAddress,
    required this.toLatLng,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 14),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: CustomColors.gray214,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomTextStyles.zeplin10pt().copyWith(
              color: CustomColors.blue178,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 18),
          Text(
            Strings.FROM_TEXT.tr,
            style: CustomTextStyles.zeplin8pt().copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            fromAddress,
            style: CustomTextStyles.zeplin8pt().copyWith(
              color: CustomColors.gray78,
            ),
          ),
          InkWell(
            onTap: () {
              MapUtils.openMap(
                title: fromAddress,
                lat: fromLatLng.latitude,
                lng: fromLatLng.longitude,
              );
            },
            child: Text(
              Strings.VIEW_ON_GOOGLE_MAP_TEXT.tr,
              style: CustomTextStyles.zeplin6p5pt().copyWith(
                color: CustomColors.blue178,
              ),
            ),
          ),
          SizedBox(height: 18),
          Text(
            Strings.TO_TEXT.tr,
            style: CustomTextStyles.zeplin8pt().copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            toAddress,
            style: CustomTextStyles.zeplin8pt().copyWith(
              color: CustomColors.gray78,
            ),
          ),
          InkWell(
            onTap: () {
              MapUtils.openMap(
                title: toAddress,
                lat: toLatLng.latitude,
                lng: toLatLng.longitude,
              );
            },
            child: Text(
              Strings.VIEW_ON_GOOGLE_MAP_TEXT.tr,
              style: CustomTextStyles.zeplin6p5pt().copyWith(
                color: CustomColors.blue178,
              ),
            ),
          ),
          SizedBox(height: 18),
          _buildDateTime(),
          SizedBox(height: 18),
        ],
      ),
    );
  }

  Row _buildDateTime() {
    return Row(
      children: [
        Assets.images.imgIconOutlineCalendar.image(
          height: 14,
          width: 14,
        ),
        SizedBox(width: 6),
        Text(
          date,
          style: CustomTextStyles.zeplin8pt().copyWith(
            color: CustomColors.gray78,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
