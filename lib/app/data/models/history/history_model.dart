import 'package:json_annotation/json_annotation.dart';

part 'history_model.g.dart';

@JsonSerializable()
class HistoryModel {
  int? id;
  int? deliveryId;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;

  HistoryModel({
    this.id,
    this.deliveryId,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryModelToJson(this);
}
