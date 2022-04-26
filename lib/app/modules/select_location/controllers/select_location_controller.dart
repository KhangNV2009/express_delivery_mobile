import 'dart:async';

import 'package:express_delivery/app/modules/main_customer/book_truck/controllers/book_truck_controller.dart';
import 'package:express_delivery/app/modules/main_customer/warehouse/warehouse_create/controllers/warehouse_create_controller.dart';
import 'package:express_delivery/app/modules/main_customer/warehouse/warehouse_edit/controllers/warehouse_edit_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/models/location/location_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/location_utils.dart';
import '../../main_customer/customer_account_info/controllers/customer_account_info_controller.dart';

class SelectLocationController extends GetxController {
  final previousRoute = ''.obs;

  final Completer<GoogleMapController> googleMapController = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}.obs;
  RxList<Placemark> placeMarks = RxList<Placemark>();
  RxList<Circle> circles = RxList<Circle>();
  final address = ''.obs;
  final coordinates = <double>[].obs;
  final enableButton = false.obs;

  /// location
  double? lat;
  double? lng;
  String? street;
  String? ward;
  String? district;
  String? city;

  @override
  void onInit() {
    super.onInit();
    initPreviousRoute();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void placeMarker(LatLng latLng) async {
    placeMarks.value = await LocationUtils.getAddress(
      latLng: latLng,
      locale: LocationUtils.VN,
    );
    handlePlaceMark();

    final MarkerId markerId = MarkerId('test');
    final Marker marker = Marker(
      markerId: markerId,
      position: latLng,
      infoWindow: InfoWindow(
        title: address.value,
        snippet: 'lat: ${latLng.latitude},\nlong: ${latLng.longitude}',
        onTap: () {},
      ),
    );
    markers[markerId] = marker;
    coordinates.value = [latLng.longitude, latLng.latitude];
    lat = latLng.latitude;
    lng = latLng.longitude;
  }

  void handlePlaceMark() {
    final placeMark = placeMarks[0];

    address.value = '';

    if (placeMark.subThoroughfare != '') {
      address.value = address + '${placeMark.subThoroughfare}';
    }
    if (placeMark.thoroughfare != '') {
      address.value = address + ' ' + '${placeMark.thoroughfare},';
      street = address.value;
    }
    if (placeMark.subAdministrativeArea != '') {
      address.value = address + ' ' + '${placeMark.subAdministrativeArea},';
      district = placeMark.subAdministrativeArea;
    }
    if (placeMark.locality != '') {
      address.value = address + ' ' + '${placeMark.locality},';
      ward = placeMark.locality;
    }
    if (placeMark.administrativeArea != '') {
      address.value = address + ' ' + '${placeMark.administrativeArea}';
      city = placeMark.administrativeArea;
    }
    onCheckEnableButton();
  }

  void onCheckEnableButton() {
    enableButton.value = address.isNotEmpty;
  }

  void initPreviousRoute() {
    final String previousRoute = Get.previousRoute;
    if (previousRoute.contains(Routes.WAREHOUSE_CREATE)) {
      this.previousRoute.value = Routes.WAREHOUSE_CREATE;
    }
    if (previousRoute.contains(Routes.WAREHOUSE_EDIT)) {
      this.previousRoute.value = Routes.WAREHOUSE_EDIT;
    }
    if(previousRoute.contains(Routes.CUSTOMER_ACCOUNT_INFO)) {
      this.previousRoute.value = Routes.CUSTOMER_ACCOUNT_INFO;
    }
    if(previousRoute.contains(Routes.BOOK_TRUCK)) {
      this.previousRoute.value = Routes.BOOK_TRUCK;
    }
  }

  void onConfirmTap() {
    switch (previousRoute.value) {
      case Routes.WAREHOUSE_CREATE:
        final _createWarehouseController = Get.find<WarehouseCreateController>();
        _createWarehouseController.address.value = address.value;
        _createWarehouseController.locationModel = LocationModel(
          lat: lat,
          lng: lng,
          street: street,
          ward: ward,
          district: district,
          city: city,
        );
        Get.back();
        break;
      case Routes.WAREHOUSE_EDIT:
        final _editWarehouseController = Get.find<WarehouseEditController>();
        _editWarehouseController.address.value = address.value;
        _editWarehouseController.locationModel = LocationModel(
          lat: lat,
          lng: lng,
          street: street,
          ward: ward,
          district: district,
          city: city,
        );
        Get.back();
        break;
      case Routes.CUSTOMER_ACCOUNT_INFO:
        final _customerAccountInfoController = Get.put(CustomerAccountInfoController());
        _customerAccountInfoController.changeLocation(
          lat: lat ?? 0.0,
          lng: lng ?? 0.0,
          street: street ?? '',
          ward: ward ?? '',
          district: district ?? '',
          city: city ?? '',
        );
        Get.back();
        break;
      case Routes.BOOK_TRUCK:
        final BookTruckController _bookTruckController = Get.put(BookTruckController());
        _bookTruckController.locationModel = LocationModel(
          lat: lat,
          lng: lng,
          street: street,
          ward: ward,
          district: district,
          city: city,
        );
        _bookTruckController.markSelected(1);
        Get.back();
        break;
      default:
        break;
    }
  }
}
