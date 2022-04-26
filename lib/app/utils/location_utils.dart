import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationUtils {
  static const VN = 'vn';
  static const EN = 'en';

  static Future<List<Placemark>> getAddress({
    required LatLng latLng,
    required String locale,
  }) async {
    return await placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
      localeIdentifier: locale,
    );
  }
}