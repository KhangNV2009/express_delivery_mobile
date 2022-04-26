import 'package:express_delivery/app/data/models/package/package_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../core/base_response.dart';

part 'package_response.g.dart';

@JsonSerializable()
class PackageResponse extends BaseResponse {
  List<PackageModel>? data;

  PackageResponse({
    int? statusCode,
    String? message,
    this.data,
  }) : super(
    statusCode: statusCode,
    message: message,
  );

  factory PackageResponse.fromJson(Map<String, dynamic> json) =>
      _$PackageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PackageResponseToJson(this);
}