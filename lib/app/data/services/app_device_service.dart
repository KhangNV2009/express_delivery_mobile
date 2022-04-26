import '../../constants/core_remote_constants.dart';
import '../models/core/base_response.dart';
import 'core_service.dart';

abstract class IAppDeviceService {
  Future<BaseResponse> createAppDevice({
    required String platform,
    required String token,
  });
}

class AppDeviceService implements IAppDeviceService {
  CoreService service = CoreService();

  ///Constructors
  static final AppDeviceService _instance = AppDeviceService._internal();

  AppDeviceService._internal();

  factory AppDeviceService() {
    return _instance;
  }

  static const _appDevices = 'app-device';

  @override
  Future<BaseResponse> createAppDevice({
    required String platform,
    required String token,
  }) async {
    BaseResponse response = BaseResponse();
    await service.performRequest(
      url: _appDevices,
      body: {
        'platform': platform,
        'token': token,
      },
      method: CoreHTTPMethod.post,
      onResponse: (data) {
        response = BaseResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }
}
