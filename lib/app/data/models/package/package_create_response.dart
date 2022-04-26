import 'package:express_delivery/app/data/models/package/package_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../core/base_response.dart';

part 'package_create_response.g.dart';

@JsonSerializable()
class PackageCreateResponse extends BaseResponse {
  PackageModel? data;

  PackageCreateResponse({
    int? statusCode,
    String? message,
    this.data,
  }) : super(
    statusCode: statusCode,
    message: message,
  );

  factory PackageCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$PackageCreateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PackageCreateResponseToJson(this);
}