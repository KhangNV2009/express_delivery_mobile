// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryModel _$DeliveryModelFromJson(Map<String, dynamic> json) {
  return DeliveryModel(
    id: json['id'] as int?,
    customerId: json['customerId'] as int?,
    warehouseId: json['warehouseId'] as int?,
    state: json['state'] as int?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    location: json['location'] == null
        ? null
        : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    warehouse: json['warehouse'] == null
        ? null
        : DeliveryWarehouseModel.fromJson(
            json['warehouse'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeliveryModelToJson(DeliveryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'warehouseId': instance.warehouseId,
      'state': instance.state,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'location': instance.location,
      'warehouse': instance.warehouse,
    };
