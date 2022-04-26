// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_create_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageCreateResponse _$PackageCreateResponseFromJson(
    Map<String, dynamic> json) {
  return PackageCreateResponse(
    statusCode: json['statusCode'] as int?,
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : PackageModel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PackageCreateResponseToJson(
        PackageCreateResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
