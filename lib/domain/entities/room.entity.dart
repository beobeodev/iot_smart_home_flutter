import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:iot_smart_home/domain/entities/device.entity.dart';

part 'room.entity.g.dart';

@JsonSerializable()
class RoomEntity extends Equatable {
  final String name;
  final List<DeviceEntity>? devices;

  const RoomEntity({required this.name, this.devices});

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [name, devices];

  factory RoomEntity.fromJson(Map<String, dynamic> json) =>
      _$RoomEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RoomEntityToJson(this);
}
