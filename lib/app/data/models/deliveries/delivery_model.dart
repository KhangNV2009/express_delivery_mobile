import 'package:express_delivery/app/data/models/location/location_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../package/package_model.dart';
import '../warehouse/delivery_warehouse_model.dart';

part 'delivery_model.g.dart';

@JsonSerializable()
class DeliveryModel {
  int? id;
  int? customerId;
  int? warehouseId;
  int? state;
  String? createdAt;
  String? updatedAt;
  LocationModel? location;
  DeliveryWarehouseModel? warehouse;

  DeliveryModel({
    this.id,
    this.customerId,
    this.warehouseId,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.location,
    this.warehouse,
  });

  factory DeliveryModel.fromJson(Map<String, dynamic> json) => _$DeliveryModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryModelToJson(this);
}
