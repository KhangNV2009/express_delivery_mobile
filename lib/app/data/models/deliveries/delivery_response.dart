import 'package:json_annotation/json_annotation.dart';

import '../core/base_response.dart';
import 'delivery_model.dart';

part 'delivery_response.g.dart';

@JsonSerializable()
class DeliveryResponse extends BaseResponse {
  List<DeliveryModel>? data;

  DeliveryResponse({
    int? statusCode,
    String? message,
    this.data,
  }) : super(
    statusCode: statusCode,
    message: message,
  );

  factory DeliveryResponse.fromJson(Map<String, dynamic> json) =>
      _$DeliveryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryResponseToJson(this);
}