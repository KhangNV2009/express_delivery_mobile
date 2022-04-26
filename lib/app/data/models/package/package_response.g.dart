// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageResponse _$PackageResponseFromJson(Map<String, dynamic> json) {
  return PackageResponse(
    statusCode: json['statusCode'] as int?,
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => PackageModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PackageResponseToJson(PackageResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
