// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseResponse _$WarehouseResponseFromJson(Map<String, dynamic> json) {
  return WarehouseResponse(
    statusCode: json['statusCode'] as int?,
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => WarehouseModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WarehouseResponseToJson(WarehouseResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
