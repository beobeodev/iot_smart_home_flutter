import 'package:json_annotation/json_annotation.dart';

import 'package:iot_smart_home/domain/entities/user.entity.dart';

part 'user.model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel({String? customerName, String? customerPhone})
      : super(customerName: customerName, customerPhone: customerPhone);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
