import 'package:express_delivery/app/data/models/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../core/base_response.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends BaseResponse {
  UserModel? data;

  UserResponse({
    int? statusCode,
    String? message,
    this.data,
  }) : super(
    statusCode: statusCode,
    message: message,
  );

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

}
