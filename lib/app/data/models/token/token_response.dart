import 'package:express_delivery/app/data/models/token/token_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../core/base_response.dart';

part 'token_response.g.dart';

@JsonSerializable()
class TokenResponse extends BaseResponse {
  TokenModel? data;

  TokenResponse({
    int? statusCode,
    String? message,
    this.data,
  }) : super(
          statusCode: statusCode,
          message: message,
        );

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);

}
