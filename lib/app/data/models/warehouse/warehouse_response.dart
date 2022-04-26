import 'package:express_delivery/app/data/models/warehouse/warehouse_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../core/base_response.dart';

part 'warehouse_response.g.dart';

@JsonSerializable()
class WarehouseResponse extends BaseResponse {
  List<WarehouseModel>? data;

  WarehouseResponse({
    int? statusCode,
    String? message,
    this.data,
  }) : super(
    statusCode: statusCode,
    message: message,
  );

  factory WarehouseResponse.fromJson(Map<String, dynamic> json) =>
      _$WarehouseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseResponseToJson(this);

}