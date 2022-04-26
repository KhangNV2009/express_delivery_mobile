import 'package:json_annotation/json_annotation.dart';

part 'warehouse_create_request.g.dart';

@JsonSerializable()
class WarehouseCreateRequest {
  String? name;
  dynamic lat;
  dynamic lng;
  String? street;
  String? ward;
  String? district;
  String? city;

  WarehouseCreateRequest({
    this.name,
    this.lat,
    this.lng,
    this.street,
    this.ward,
    this.district,
    this.city,
  });

  factory WarehouseCreateRequest.fromJson(Map<String, dynamic> json) => _$WarehouseCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseCreateRequestToJson(this);
}
