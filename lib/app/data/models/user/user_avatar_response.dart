import 'package:json_annotation/json_annotation.dart';

import '../core/base_response.dart';

part 'user_avatar_response.g.dart';

@JsonSerializable()
class UserAvatarResponse extends BaseResponse {
  String? data;

  UserAvatarResponse({
    int? statusCode,
    String? message,
    this.data,
  }) : super(
    statusCode: statusCode,
    message: message,
  );

  factory UserAvatarResponse.fromJson(Map<String, dynamic> json) =>
      _$UserAvatarResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserAvatarResponseToJson(this);
}