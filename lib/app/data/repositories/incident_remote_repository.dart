import 'package:express_delivery/app/data/models/core/base_response.dart';
import 'package:express_delivery/app/data/models/history/history_response.dart';
import 'package:express_delivery/app/data/services/incident_service.dart';

class IncidentRemoteRepository implements IIncidentService {
  final IncidentService _incidentService = IncidentService();

  @override
  Future<HistoryResponse> getIncidents() {
    return _incidentService.getIncidents();
  }

  @override
  Future<BaseResponse> createIncident({
    required int deliveryId,
    required int customerId,
    required String title,
    required String description,
  }) {
    return _incidentService.createIncident(
      deliveryId: deliveryId,
      customerId: customerId,
      title: title,
      description: description,
    );
  }
}
