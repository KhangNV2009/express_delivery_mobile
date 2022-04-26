import 'package:express_delivery/app/data/models/session/session_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../core/base_response.dart';

part 'session_response.g.dart';

@JsonSerializable()
class SessionResponse extends BaseResponse {
  List<SessionModel>? data;

  SessionResponse({
    int? statusCode,
    String? message,
    this.data,
  }) : super(
    statusCode: statusCode,
    message: message,
  );

  factory SessionResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SessionResponseToJson(this);

}