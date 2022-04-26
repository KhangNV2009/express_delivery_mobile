import 'package:express_delivery/app/data/models/session/session_response.dart';

import '../../constants/core_remote_constants.dart';
import 'core_service.dart';

abstract class ISessionService {
  Future<SessionResponse> getCustomerSession();
  Future<SessionResponse> getDriverSession();
}

class SessionService implements ISessionService {
  CoreService service = CoreService();

  ///Constructors
  static final SessionService _instance = SessionService._internal();

  SessionService._internal();

  factory SessionService() {
    return _instance;
  }

  static const _sessions = 'sessions';
  static const _customer = 'customer';
  static const _driver = 'driver';

  @override
  Future<SessionResponse> getCustomerSession() async {
    SessionResponse response = SessionResponse();
    await service.performRequest(
      url: '$_sessions/$_customer',
      method: CoreHTTPMethod.get,
      onResponse: (data) {
        response = SessionResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }

  @override
  Future<SessionResponse> getDriverSession() async {
    SessionResponse response = SessionResponse();
    await service.performRequest(
      url: '$_sessions/$_driver',
      method: CoreHTTPMethod.get,
      onResponse: (data) {
        response = SessionResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }
}