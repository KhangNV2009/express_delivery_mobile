import 'package:express_delivery/app/data/models/core/base_response.dart';
import 'package:express_delivery/app/data/models/warehouse/warehouse_create_request.dart';
import 'package:express_delivery/app/data/models/warehouse/warehouse_response.dart';
import 'package:express_delivery/app/data/services/warehouse_service.dart';

import '../models/warehouse/warehouse_response_single.dart';

class WarehouseRemoteRepository implements IWarehouseService {
  final WarehouseService _warehouseService = WarehouseService();

  @override
  Future<WarehouseResponse> getWarehouses() {
    return _warehouseService.getWarehouses();
  }

  @override
  Future<BaseResponse> createWarehouse({
    required WarehouseCreateRequest request,
  }) {
    return _warehouseService.createWarehouse(request: request);
  }

  @override
  Future<WarehouseResponseSingle> getWarehouseDetail({
    required int id,
  }) {
    return _warehouseService.getWarehouseDetail(id: id);
  }

  @override
  Future<BaseResponse> editWarehouse({
    required int id,
    required WarehouseCreateRequest request,
  }) {
    return _warehouseService.editWarehouse(
      id: id,
      request: request,
    );
  }

  @override
  Future<BaseResponse> removeWarehouse({
    required int id,
  }) {
    return _warehouseService.removeWarehouse(id: id);
  }
}
