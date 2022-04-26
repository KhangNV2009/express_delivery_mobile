// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_avatar_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAvatarResponse _$UserAvatarResponseFromJson(Map<String, dynamic> json) {
  return UserAvatarResponse(
    statusCode: json['statusCode'] as int?,
    message: json['message'] as String?,
    data: json['data'] as String?,
  );
}

Map<String, dynamic> _$UserAvatarResponseToJson(UserAvatarResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
