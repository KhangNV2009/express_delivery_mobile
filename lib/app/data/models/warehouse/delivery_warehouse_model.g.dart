// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_warehouse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryWarehouseModel _$DeliveryWarehouseModelFromJson(
    Map<String, dynamic> json) {
  return DeliveryWarehouseModel(
    id: json['id'] as int?,
    customerId: json['customerId'] as int?,
    name: json['name'] as String?,
    location: json['location'] == null
        ? null
        : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    packages: json['packages'] == null
        ? null
        : PackageModel.fromJson(json['packages'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeliveryWarehouseModelToJson(
        DeliveryWarehouseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'name': instance.name,
      'location': instance.location,
      'packages': instance.packages,
    };
