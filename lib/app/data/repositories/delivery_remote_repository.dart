import 'package:express_delivery/app/data/models/core/base_response.dart';
import 'package:express_delivery/app/data/services/delivery_service.dart';

import '../models/deliveries/delivery_response.dart';

class DeliveryRemoteRepository implements IDeliveryService {
  final DeliveryService _deliveryService = DeliveryService();

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
  }) {
    return _deliveryService.createDelivery(
      warehouseId: warehouseId,
      packageId: packageId,
      lat: lat,
      lng: lng,
      street: street,
      ward: ward,
      district: district,
      city: city,
    );
  }

  @override
  Future<DeliveryResponse> getDeliveries({required int state}) {
    return _deliveryService.getDeliveries(state: state);
  }

  @override
  Future<DeliveryResponse> getConfirmedDeliveries({required int state}) {
    return _deliveryService.getConfirmedDeliveries(state: state);
  }

  @override
  Future<BaseResponse> confirmedDelivery({
    required int warehouseId,
    required int customerId,
    required int packageId,
    required int deliveryId,
  }) {
    return _deliveryService.confirmedDelivery(
      warehouseId: warehouseId,
      customerId: customerId,
      packageId: packageId,
      deliveryId: deliveryId,
    );
  }

  @override
  Future<BaseResponse> inTransitDelivery({
    required int warehouseId,
    required int customerId,
    required int packageId,
    required int deliveryId,
  }) {
    return _deliveryService.inTransitDelivery(
      warehouseId: warehouseId,
      customerId: customerId,
      packageId: packageId,
      deliveryId: deliveryId,
    );
  }

  @override
  Future<BaseResponse> shipSuccessDelivery({
    required int warehouseId,
    required int customerId,
    required int packageId,
    required int deliveryId,
  }) {
    return _deliveryService.shipSuccessDelivery(
      warehouseId: warehouseId,
      customerId: customerId,
      packageId: packageId,
      deliveryId: deliveryId,
    );
  }
}
