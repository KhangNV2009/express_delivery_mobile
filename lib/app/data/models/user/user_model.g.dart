// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as int?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    fullName: json['fullName'] as String?,
    avatar: json['avatar'] as String?,
    roleId: json['roleId'] as int?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    location: json['location'] == null
        ? null
        : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
  )..phoneNumber = json['phoneNumber'] as String?;
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'avatar': instance.avatar,
      'roleId': instance.roleId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'location': instance.location,
    };
