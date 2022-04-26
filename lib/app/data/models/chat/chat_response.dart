import 'package:json_annotation/json_annotation.dart';

import '../core/base_response.dart';
import 'chat_model.dart';
import 'chat_paging_response.dart';

part 'chat_response.g.dart';

@JsonSerializable()
class ChatResponse extends BaseResponse {
  ChatPagingResponse? data;

  ChatResponse({
    int? statusCode,
    String? message,
    this.data,
  }) : super(
    statusCode: statusCode,
    message: message,
  );

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);
}