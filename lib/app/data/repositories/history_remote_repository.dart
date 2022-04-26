import 'package:express_delivery/app/data/models/history/history_response.dart';
import 'package:express_delivery/app/data/services/history_service.dart';

class HistoryRemoteRepository implements IHistoryService {
  final HistoryService _historyService = HistoryService();

  @override
  Future<HistoryResponse> getHistory() {
    return _historyService.getHistory();
  }
}