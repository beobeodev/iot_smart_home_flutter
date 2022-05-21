import 'package:equatable/equatable.dart';
import 'package:iot_smart_home/domain/entities/room.entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'raspberry.entity.g.dart';

@JsonSerializable()
class RaspberryEntity extends Equatable {
  final String ipMac;
  final String? customerName;
  final String? customerPhone;
  final List<RoomEntity> rooms;

  const RaspberryEntity(
      {required this.ipMac,
      this.customerName,
      this.customerPhone,
      required this.rooms});

  @override
  List<Object?> get props => [customerName, customerPhone];

  @override
  bool? get stringify => true;

  factory RaspberryEntity.fromJson(Map<String, dynamic> json) =>
      _$RaspberryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RaspberryEntityToJson(this);
}
