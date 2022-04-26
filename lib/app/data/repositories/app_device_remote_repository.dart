import 'package:express_delivery/app/data/models/core/base_response.dart';
import 'package:express_delivery/app/data/services/app_device_service.dart';

class AppDeviceRemoteRepository implements IAppDeviceService {
  final AppDeviceService _appDeviceService = AppDeviceService();

  @override
  Future<BaseResponse> createAppDevice({
    required String platform,
    required String token,
  }) {
    return _appDeviceService.createAppDevice(
      platform: platform,
      token: token,
    );
  }
}
