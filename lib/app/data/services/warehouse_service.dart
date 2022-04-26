import 'package:express_delivery/app/data/models/warehouse/warehouse_create_request.dart';
import 'package:express_delivery/app/data/models/warehouse/warehouse_response.dart';

import '../../constants/core_remote_constants.dart';
import '../models/core/base_response.dart';
import '../models/warehouse/warehouse_response_single.dart';
import 'core_service.dart';

abstract class IWarehouseService {
  Future<WarehouseResponse> getWarehouses();

  Future<WarehouseResponseSingle> getWarehouseDetail({
    required int id,
  });

  Future<BaseResponse> createWarehouse({
    required WarehouseCreateRequest request,
  });

  Future<BaseResponse> editWarehouse({
    required int id,
    required WarehouseCreateRequest request,
  });

  Future<BaseResponse> removeWarehouse({
    required int id,
  });
}

class WarehouseService implements IWarehouseService {
  CoreService service = CoreService();

  ///Constructors
  static final WarehouseService _instance = WarehouseService._internal();

  WarehouseService._internal();

  factory WarehouseService() {
    return _instance;
  }

  static const _warehouses = 'warehouses';

  @override
  Future<WarehouseResponse> getWarehouses() async {
    WarehouseResponse response = WarehouseResponse();
    await service.performRequest(
      url: _warehouses,
      method: CoreHTTPMethod.get,
      onResponse: (data) {
        response = WarehouseResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }

  @override
  Future<BaseResponse> createWarehouse({
    required WarehouseCreateRequest request,
  }) async {
    BaseResponse response = BaseResponse();
    await service.performRequest(
      url: _warehouses,
      body: request.toJson(),
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

  @override
  Future<WarehouseResponseSingle> getWarehouseDetail({
    required int id,
  }) async {
    WarehouseResponseSingle response = WarehouseResponseSingle();
    await service.performRequest(
      url: '$_warehouses/$id',
      method: CoreHTTPMethod.get,
      onResponse: (data) {
        response = WarehouseResponseSingle.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }

  @override
  Future<BaseResponse> editWarehouse({
    required int id,
    required WarehouseCreateRequest request,
  }) async {
    BaseResponse response = BaseResponse();
    await service.performRequest(
      url: '$_warehouses/$id',
      body: request.toJson(),
      method: CoreHTTPMethod.put,
      onResponse: (data) {
        response = BaseResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }

  @override
  Future<BaseResponse> removeWarehouse({
    required int id,
  }) async {
    BaseResponse response = BaseResponse();
    await service.performRequest(
      url: '$_warehouses/$id',
      method: CoreHTTPMethod.delete,
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
