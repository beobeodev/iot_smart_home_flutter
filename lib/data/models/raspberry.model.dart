import 'package:iot_smart_home/data/models/room.model.dart';
import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';

class RaspberryModel extends RaspberryEntity {
  const RaspberryModel({
    required String id,
    required String ipMac,
    String? customerName,
    String? customerPhone,
    required List<RoomModel> rooms,
  }) : super(
          id: id,
          ipMac: ipMac,
          customerName: customerName,
          customerPhone: customerPhone,
          rooms: rooms,
        );

  factory RaspberryModel.fromJson(Map<String, dynamic> json) {
    return RaspberryModel(
      id: json['_id'] as String,
      ipMac: json['ip_mac'] as String,
      customerName: json['customer_name'] as String?,
      customerPhone: json['customer_phone'] as String?,
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => RoomModel.fromJson(e))
          .toList(),
    );
  }
}
