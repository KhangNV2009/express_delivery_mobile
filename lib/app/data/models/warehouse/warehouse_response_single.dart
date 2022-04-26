import 'package:express_delivery/app/data/models/warehouse/warehouse_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../core/base_response.dart';

part 'warehouse_response_single.g.dart';

@JsonSerializable()
class WarehouseResponseSingle extends BaseResponse {
  WarehouseModel? data;

  WarehouseResponseSingle({
    int? statusCode,
    String? message,
    this.data,
  }) : super(
    statusCode: statusCode,
    message: message,
  );

  factory WarehouseResponseSingle.fromJson(Map<String, dynamic> json) =>
      _$WarehouseResponseSingleFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseResponseSingleToJson(this);

}