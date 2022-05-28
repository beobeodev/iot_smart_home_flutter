import 'package:equatable/equatable.dart';
import 'package:iot_smart_home/domain/entities/device.entity.dart';

class RoomEntity extends Equatable {
  final String name;
  final List<DeviceEntity> devices;

  const RoomEntity({required this.name, required this.devices});

  // factory RoomEntity.fromJson(Map<String, dynamic> json) {
  //   return RoomEntity(
  //       name: json['name'] as String,
  //       devices: (json['devices'] as List<dynamic>)
  //           .map((e) => DeviceEntity.fromJson(e))
  //           .toList());
  // }

  // Map<String, dynamic> toJson() => {
  //       'name': name,
  //       'devices': devices,
  //     };

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [name, devices];
}
