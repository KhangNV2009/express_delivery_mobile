import 'package:express_delivery/app/data/models/history/history_response.dart';

import '../../constants/core_remote_constants.dart';
import '../models/core/base_response.dart';
import 'core_service.dart';

abstract class IIncidentService {
  Future<HistoryResponse> getIncidents();

  Future<BaseResponse> createIncident({
    required int deliveryId,
    required int customerId,
    required String title,
    required String description,
  });
}

class IncidentService implements IIncidentService {
  CoreService service = CoreService();

  ///Constructors
  static final IncidentService _instance = IncidentService._internal();

  IncidentService._internal();

  factory IncidentService() {
    return _instance;
  }

  static const _deliveryReports = 'delivery-reports';

  @override
  Future<HistoryResponse> getIncidents() async {
    HistoryResponse response = HistoryResponse();
    await service.performRequest(
      url: _deliveryReports,
      method: CoreHTTPMethod.get,
      onResponse: (data) {
        response = HistoryResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }

  @override
  Future<BaseResponse> createIncident({
    required int deliveryId,
    required int customerId,
    required String title,
    required String description,
  }) async {
    BaseResponse response = BaseResponse();
    await service.performRequest(
      url: _deliveryReports,
      body: {
        'deliveryId': deliveryId,
        'customerId': customerId,
        'title': title,
        'description': description,
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
