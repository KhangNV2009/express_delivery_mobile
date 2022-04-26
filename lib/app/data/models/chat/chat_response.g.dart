// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) {
  return ChatResponse(
    statusCode: json['statusCode'] as int?,
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : ChatPagingResponse.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChatResponseToJson(ChatResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
