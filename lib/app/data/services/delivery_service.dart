import '../../constants/core_remote_constants.dart';
import '../models/core/base_response.dart';
import '../models/deliveries/delivery_response.dart';
import 'core_service.dart';

abstract class IDeliveryService {
  Future<BaseResponse> createDelivery({
    required int warehouseId,
    required int packageId,
    required double lat,
    required double lng,
    required String street,
    required String ward,
    required String district,
    required String city,
  });

  Future<DeliveryResponse> getDeliveries({required int state});

  Future<DeliveryResponse> getConfirmedDeliveries({required int state});

  Future<BaseResponse> confirmedDelivery({
    required int warehouseId,
    required int customerId,
    required int packageId,
    required int deliveryId,
  });

  Future<BaseResponse> inTransitDelivery({
    required int warehouseId,
    required int customerId,
    required int packageId,
    required int deliveryId,
  });

  Future<BaseResponse> shipSuccessDelivery({
    required int warehouseId,
    required int customerId,
    required int packageId,
    required int deliveryId,
  });
}

class DeliveryService implements IDeliveryService {
  CoreService service = CoreService();

  ///Constructors
  static final DeliveryService _instance = DeliveryService._internal();

  DeliveryService._internal();

  factory DeliveryService() {
    return _instance;
  }

  static const _deliveryOrders = 'delivery-orders';
  static const _confirmed = 'confirmed';
  static const _inTransit = 'in-transit';
  static const _shipSuccess = 'ship-success';

  @override
  Future<BaseResponse> createDelivery({
    required int warehouseId,
    required int packageId,
    required double lat,
    required double lng,
    required String street,
    required String ward,
    required String district,
    required String city,
  }) async {
    BaseResponse response = BaseResponse();
    await service.performRequest(
      url: _deliveryOrders,
      body: {
        'warehouseId': warehouseId,
        'packageId': packageId,
        'lat': lat,
        'lng': lng,
        'street': street,
        'ward': ward,
        'district': district,
        'city': city,
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

  @override
  Future<DeliveryResponse> getDeliveries({required int state}) async {
    DeliveryResponse response = DeliveryResponse();
    final Map<String, dynamic> query = {};
    query['state'] = state;
    await service.performRequest(
      query: query,
      url: _deliveryOrders,
      method: CoreHTTPMethod.get,
      onResponse: (data) {
        response = DeliveryResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }

  @override
  Future<DeliveryResponse> getConfirmedDeliveries({required int state}) async {
    DeliveryResponse response = DeliveryResponse();
    final Map<String, dynamic> query = {};
    query['state'] = state;
    await service.performRequest(
      query: query,
      url: '$_deliveryOrders/$_confirmed',
      method: CoreHTTPMethod.get,
      onResponse: (data) {
        response = DeliveryResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }

  @override
  Future<BaseResponse> confirmedDelivery({
    required int warehouseId,
    required int customerId,
    required int packageId,
    required int deliveryId,
  }) async {
    BaseResponse response = BaseResponse();
    await service.performRequest(
      url: '$_deliveryOrders/$_confirmed',
      body: {
        'warehouseId': warehouseId,
        'customerId': customerId,
        'packageId': packageId,
        'deliveryId': deliveryId,
      },
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
  Future<BaseResponse> inTransitDelivery({
    required int warehouseId,
    required int customerId,
    required int packageId,
    required int deliveryId,
  }) async {
    BaseResponse response = BaseResponse();
    await service.performRequest(
      url: '$_deliveryOrders/$_inTransit',
      body: {
        'warehouseId': warehouseId,
        'customerId': customerId,
        'packageId': packageId,
        'deliveryId': deliveryId,
      },
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
  Future<BaseResponse> shipSuccessDelivery({
    required int warehouseId,
    required int customerId,
    required int packageId,
    required int deliveryId,
  }) async {
    BaseResponse response = BaseResponse();
    await service.performRequest(
      url: '$_deliveryOrders/$_shipSuccess',
      body: {
        'warehouseId': warehouseId,
        'customerId': customerId,
        'packageId': packageId,
        'deliveryId': deliveryId,
      },
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
}
