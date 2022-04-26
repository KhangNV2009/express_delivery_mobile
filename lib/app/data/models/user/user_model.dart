import 'package:json_annotation/json_annotation.dart';

import '../location/location_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int? id;
  String? email;
  String? password;
  String? fullName;
  String? phoneNumber;
  String? avatar;
  int? roleId;
  String? createdAt;
  String? updatedAt;
  LocationModel? location;

  UserModel({
    this.id,
    this.email,
    this.password,
    this.fullName,
    this.avatar,
    this.roleId,
    this.createdAt,
    this.updatedAt,
    this.location,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
