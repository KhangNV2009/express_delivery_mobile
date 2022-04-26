import 'package:json_annotation/json_annotation.dart';

import '../location/location_model.dart';
import '../package/package_model.dart';

part 'delivery_warehouse_model.g.dart';

@JsonSerializable()
class DeliveryWarehouseModel {
  int? id;
  int? customerId;
  String? name;
  LocationModel? location;
  PackageModel? packages;

  DeliveryWarehouseModel({
    this.id,
    this.customerId,
    this.name,
    this.location,
    this.packages,
  });

  factory DeliveryWarehouseModel.fromJson(Map<String, dynamic> json) => _$DeliveryWarehouseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryWarehouseModelToJson(this);
}