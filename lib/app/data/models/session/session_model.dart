import 'package:json_annotation/json_annotation.dart';

import '../chat/chat_model.dart';
import '../user/user_model.dart';

part 'session_model.g.dart';

@JsonSerializable()
class SessionModel {
  int? id;
  int? customerId;
  int? driverId;
  String? createdAt;
  String? updatedAt;
  List<ChatModel>? chats;
  UserModel? customer;
  UserModel? driver;

  SessionModel({
    this.id,
    this.customerId,
    this.driverId,
    this.createdAt,
    this.updatedAt,
    this.customer,
    this.driver,
    this.chats,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) => _$SessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionModelToJson(this);
}
