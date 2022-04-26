import 'package:express_delivery/app/data/models/session/session_response.dart';
import 'package:express_delivery/app/data/services/session_service.dart';

class SessionRemoteRepository extends ISessionService {
  final SessionService _sessionService = SessionService();

  @override
  Future<SessionResponse> getCustomerSession() {
    return _sessionService.getCustomerSession();
  }

  @override
  Future<SessionResponse> getDriverSession() {
    return _sessionService.getDriverSession();
  }
}
