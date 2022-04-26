import 'package:json_annotation/json_annotation.dart';

import '../../../constants/core_remote_constants.dart';
import 'core_response.dart';
import 'core_response_error.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse extends CoreResponse {
  int? statusCode;
  BaseResponse({
    this.statusCode = 200,
    message="",
  }) : super(
    message: message,
  );


  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);


  @override
  bool isSuccessCode() {
    return (statusCode == CoreHttpCode.OK);
  }

  bool get success => isSuccessCode();

  @override
  @JsonKey(name: "message")
  String get message => super.message ?? '';

  @override
  void setErrorMessage(String message) {
    super.message = message;
  }

  void updateErrorResponse(CoreResponseError error) {
    statusCode = error.errorCode;
    message = (error.message?.isEmpty ?? true)? "Cannot connect to server" : error.message;
  }
}
