import 'package:express_delivery/app/utils/snack_bar_utils.dart';
import 'package:map_launcher/map_launcher.dart';

import 'app_strings.dart';

class MapUtils {
  static Future<void> openMap({
    required String title,
    required double lat,
    required double lng,
  }) async {
    if (await MapLauncher.isMapAvailable(MapType.google) ?? false) {
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: Coords(lat, lng),
        title: title,
      );
    } else {
      SnackBarUtils().showWarningSnackBar('Google map is not available');
    }
  }
}