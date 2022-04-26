import 'package:json_annotation/json_annotation.dart';

import '../core/base_response.dart';
import 'history_model.dart';

part 'history_response.g.dart';

@JsonSerializable()
class HistoryResponse extends BaseResponse {
  List<HistoryModel>? data;

  HistoryResponse({
    int? statusCode,
    String? message,
    this.data,
  }) : super(
    statusCode: statusCode,
    message: message,
  );

  factory HistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryResponseToJson(this);

}