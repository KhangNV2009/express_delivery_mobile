import 'package:json_annotation/json_annotation.dart';
import 'chat_model.dart';

part 'chat_paging_response.g.dart';

@JsonSerializable()
class ChatPagingResponse {
  int? count;
  List<ChatModel>? rows;

  ChatPagingResponse({
    this.count,
    this.rows,
  });

  factory ChatPagingResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatPagingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatPagingResponseToJson(this);
}