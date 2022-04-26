// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseCreateRequest _$WarehouseCreateRequestFromJson(
    Map<String, dynamic> json) {
  return WarehouseCreateRequest(
    name: json['name'] as String?,
    lat: json['lat'],
    lng: json['lng'],
    street: json['street'] as String?,
    ward: json['ward'] as String?,
    district: json['district'] as String?,
    city: json['city'] as String?,
  );
}

Map<String, dynamic> _$WarehouseCreateRequestToJson(
        WarehouseCreateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
      'street': instance.street,
      'ward': instance.ward,
      'district': instance.district,
      'city': instance.city,
    };
