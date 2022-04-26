// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_paging_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatPagingResponse _$ChatPagingResponseFromJson(Map<String, dynamic> json) {
  return ChatPagingResponse(
    count: json['count'] as int?,
    rows: (json['rows'] as List<dynamic>?)
        ?.map((e) => ChatModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ChatPagingResponseToJson(ChatPagingResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows,
    };
