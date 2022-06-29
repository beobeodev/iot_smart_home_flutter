import 'package:iot_smart_home/domain/entities/device.entity.dart';

class DeviceModel extends DeviceEntity {
  DeviceModel({
    required String id,
    required String name,
    required int gate,
    required bool status,
  }) : super(id: id, name: name, gate: gate, status: status);

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      gate: json['gate'] as int,
      status: json['status'] as bool,
    );
  }
}
