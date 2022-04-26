// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) {
  return SessionModel(
    id: json['id'] as int?,
    customerId: json['customerId'] as int?,
    driverId: json['driverId'] as int?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    customer: json['customer'] == null
        ? null
        : UserModel.fromJson(json['customer'] as Map<String, dynamic>),
    driver: json['driver'] == null
        ? null
        : UserModel.fromJson(json['driver'] as Map<String, dynamic>),
    chats: (json['chats'] as List<dynamic>?)
        ?.map((e) => ChatModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'driverId': instance.driverId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'chats': instance.chats,
      'customer': instance.customer,
      'driver': instance.driver,
    };
