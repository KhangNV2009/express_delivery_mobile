import 'package:json_annotation/json_annotation.dart';

part 'package_model.g.dart';

@JsonSerializable()
class PackageModel {
  int? id;
  String? name;
  double? weight;
  String? category;

  PackageModel({
    this.id,
    this.name,
    this.weight,
    this.category,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) => _$PackageModelFromJson(json);

  Map<String, dynamic> toJson() =>_$PackageModelToJson(this);
}