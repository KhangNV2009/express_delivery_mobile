import 'package:express_delivery/app/data/models/history/history_response.dart';

import '../../constants/core_remote_constants.dart';
import 'core_service.dart';

abstract class IHistoryService {
  Future<HistoryResponse> getHistory();
}

class HistoryService implements IHistoryService {
  CoreService service = CoreService();

  ///Constructors
  static final HistoryService _instance = HistoryService._internal();

  HistoryService._internal();

  factory HistoryService() {
    return _instance;
  }

  static const _deliveryHistories = 'delivery-histories';

  @override
  Future<HistoryResponse> getHistory() async {
    HistoryResponse response = HistoryResponse();
    await service.performRequest(
      url: _deliveryHistories,
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
}
