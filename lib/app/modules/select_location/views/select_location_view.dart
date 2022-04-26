import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../components/app_bars/custom_app_bars.dart';
import '../../../components/base/base_screen_view.dart';
import '../../../components/buttons/custom_buttons.dart';
import '../../../constants/custom_colors.dart';
import '../../../constants/custom_text_styles.dart';
import '../../../utils/app_strings.dart';
import '../controllers/select_location_controller.dart';

class SelectLocationView extends GetView<SelectLocationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.SELECT_LOCATION_TEXT.tr,
      ),
      body: BaseScreenView(
        child: Column(
          children: [
            SizedBox(height: 22),
            _buildGoogleMap(),
            _buildAddressInfo(),
          ],
        ),
      ),
    );
  }

  Expanded _buildGoogleMap() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Obx(
            () => GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  10.801407,
                  106.707625,
                ),
                zoom: 15.0,
              ),
              onMapCreated: (GoogleMapController controller) async {
                this.controller.googleMapController.complete(controller);
              },
              onLongPress: (latLong) {
                controller.placeMarker(latLong);
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapToolbarEnabled: false,
              zoomControlsEnabled: false,
              markers: Set<Marker>.of(controller.markers.values),
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildAddressInfo() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildAddress(),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Obx(
                () => CustomButtons().secondaryButton(
                  title: Strings.CONFIRM_TEXT.tr,
                  isEnable: controller.enableButton.value,
                  onTap: controller.onConfirmTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildAddress() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: CustomColors.gray214,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 2),
            child: Icon(
              FontAwesomeIcons.mapLocationDot,
              size: 14,
            ),
          ),
          SizedBox(width: 6),
          Expanded(
            child: Obx(
              () => Text(
                controller.address.value,
                style: CustomTextStyles.zeplin8pt().copyWith(
                  color: CustomColors.gray78,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
