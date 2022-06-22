import 'package:iot_smart_home/domain/entities/device.entity.dart';

class DeviceModel extends DeviceEntity {
  DeviceModel({required String name, required int gate, required bool status})
      : super(name: name, gate: gate, status: status);

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      name: json['name'] as String,
      gate: json['gate'] as int,
      status: json['status'] as bool,
    );
  }
}
