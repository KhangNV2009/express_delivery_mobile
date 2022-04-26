import 'package:json_annotation/json_annotation.dart';

import '../../../constants/core_remote_constants.dart';

part 'core_response.g.dart';

@JsonSerializable()
class CoreResponse extends Object {
  String? message;
  @JsonKey(ignore: true)
  int headerErrorCode = CoreHttpCode.OK;

  //
  CoreResponse({
    this.message = ""
  });

  bool isSuccessCode() {
    return headerErrorCode == CoreHttpCode.OK;
  }

  void setErrorMessage(String message) {
    message = message;
  }

  factory CoreResponse.fromJson(Map<String, dynamic> json) =>
      _$CoreResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CoreResponseToJson(this);
}
