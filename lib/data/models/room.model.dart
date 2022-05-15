import 'package:json_annotation/json_annotation.dart';

import 'package:iot_smart_home/data/models/device.model.dart';
import 'package:iot_smart_home/domain/entities/room.entity.dart';

part 'room.model.g.dart';

@JsonSerializable()
class RoomModel extends RoomEntity {
  const RoomModel({required String name, List<DeviceModel>? devices})
      : super(name: name, devices: devices);

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
}
