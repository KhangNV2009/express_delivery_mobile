import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  int? id;
  dynamic lat;
  dynamic lng;
  String? street;
  String? ward;
  String? district;
  String? city;
  String? createdAt;
  String? updatedAt;

  LocationModel({
    this.id,
    this.lat,
    this.lng,
    this.street,
    this.ward,
    this.district,
    this.city,
    this.createdAt,
    this.updatedAt,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);

  String? get address {
    if(street == null || district == null || city == null) {
      return 'Your address was not updated';
    } else {
      return '$street $district, $city';
    }
  }
}
