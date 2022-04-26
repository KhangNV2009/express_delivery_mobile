// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryResponse _$DeliveryResponseFromJson(Map<String, dynamic> json) {
  return DeliveryResponse(
    statusCode: json['statusCode'] as int?,
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => DeliveryModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DeliveryResponseToJson(DeliveryResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
