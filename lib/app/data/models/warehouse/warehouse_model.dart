import 'package:json_annotation/json_annotation.dart';

import '../location/location_model.dart';
import '../package/package_model.dart';

part 'warehouse_model.g.dart';

@JsonSerializable()
class WarehouseModel {
  int? id;
  String? name;
  LocationModel? location;
  List<PackageModel>? packages;

  WarehouseModel({
    this.id,
    this.name,
    this.location,
    this.packages,
  });

  factory WarehouseModel.fromJson(Map<String, dynamic> json) => _$WarehouseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseModelToJson(this);
}