import 'package:iot_smart_home/domain/entities/device.entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device.model.g.dart';

@JsonSerializable(createToJson: false)
class DeviceModel extends DeviceEntity {
  const DeviceModel({required String name, required int gate, bool? status})
      : super(name: name, gate: gate, status: status);

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);
}
