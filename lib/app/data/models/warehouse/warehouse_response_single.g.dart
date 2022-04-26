// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_response_single.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseResponseSingle _$WarehouseResponseSingleFromJson(
    Map<String, dynamic> json) {
  return WarehouseResponseSingle(
    statusCode: json['statusCode'] as int?,
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : WarehouseModel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WarehouseResponseSingleToJson(
        WarehouseResponseSingle instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
