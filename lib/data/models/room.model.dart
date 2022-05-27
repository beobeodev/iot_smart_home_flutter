import 'package:iot_smart_home/data/models/device.model.dart';
import 'package:iot_smart_home/domain/entities/room.entity.dart';

class RoomModel extends RoomEntity {
  const RoomModel({required String name, required List<DeviceModel> devices})
      : super(name: name, devices: devices);

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
        name: json['name'] as String,
        devices: (json['devices'] as List<dynamic>)
            .map((e) => DeviceModel.fromJson(e))
            .toList());
  }
}
