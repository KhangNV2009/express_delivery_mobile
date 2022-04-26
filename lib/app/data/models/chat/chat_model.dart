
import 'package:json_annotation/json_annotation.dart';

import '../user/user_model.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel {
  int? id;
  int? userId;
  int? sessionId;
  String? text;
  List<String>? images;
  UserModel? user;
  String? createdAt;
  String? updatedAt;

  ChatModel({
    this.id,
    this.userId,
    this.sessionId,
    this.text,
    this.images,
    this.user,
    this.createdAt,
    this.updatedAt,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}
