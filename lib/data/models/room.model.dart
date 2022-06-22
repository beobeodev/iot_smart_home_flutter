import 'package:iot_smart_home/data/models/device.model.dart';
import 'package:iot_smart_home/domain/entities/room.entity.dart';

class RoomModel extends RoomEntity {
  RoomModel(
      {required String id,
      required String name,
      required List<DeviceModel> devices})
      : super(id: id, name: name, devices: devices);

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
        id: json['_id'] as String,
        name: json['name'] as String,
        devices: (json['devices'] as List<dynamic>)
            .map((e) => DeviceModel.fromJson(e))
            .toList());
  }
}
