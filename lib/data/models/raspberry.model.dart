import 'package:iot_smart_home/data/models/room.model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';

part 'raspberry.model.g.dart';

@JsonSerializable()
class RaspberryModel extends RaspberryEntity {
  const RaspberryModel(
      {required String ipMac,
      String? customerName,
      String? customerPhone,
      required List<RoomModel> rooms})
      : super(
            ipMac: ipMac,
            customerName: customerName,
            customerPhone: customerPhone,
            rooms: rooms);

  factory RaspberryModel.fromJson(Map<String, dynamic> json) =>
      _$RaspberryModelFromJson(json);
}
