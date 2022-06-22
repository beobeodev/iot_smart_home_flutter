import 'package:iot_smart_home/domain/entities/device.entity.dart';

class RoomEntity {
  String? id;
  String name;
  List<DeviceEntity> devices;

  RoomEntity({this.id, required this.name, required this.devices});

  // factory RoomEntity.fromJson(Map<String, dynamic> json) {
  //   return RoomEntity(
  //       name: json['name'] as String,
  //       devices: (json['devices'] as List<dynamic>)
  //           .map((e) => DeviceEntity.fromJson(e))
  //           .toList());
  // }

  Map<String, dynamic> toJson() => {
        'name': name,
        'devices': devices.map((e) => e.toJson()).toList(),
      };
}
