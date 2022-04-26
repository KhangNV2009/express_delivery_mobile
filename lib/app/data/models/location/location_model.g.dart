// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return LocationModel(
    id: json['id'] as int?,
    lat: json['lat'],
    lng: json['lng'],
    street: json['street'] as String?,
    ward: json['ward'] as String?,
    district: json['district'] as String?,
    city: json['city'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lng': instance.lng,
      'street': instance.street,
      'ward': instance.ward,
      'district': instance.district,
      'city': instance.city,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
