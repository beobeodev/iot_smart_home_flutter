import 'package:equatable/equatable.dart';
import 'package:iot_smart_home/domain/entities/room.entity.dart';

class RaspberryEntity extends Equatable {
  final String id;
  final String ipMac;
  final String? customerName;
  final String? customerPhone;
  final List<RoomEntity> rooms;

  const RaspberryEntity({
    required this.id,
    required this.ipMac,
    this.customerName,
    this.customerPhone,
    required this.rooms,
  });

  factory RaspberryEntity.fromJson(Map<String, dynamic> json) {
    return RaspberryEntity(
      id: json['_id'] as String,
      ipMac: json['ip_mac'] as String,
      customerName: json['customer_name'] as String?,
      customerPhone: json['customer_phone'] as String?,
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => RoomEntity.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'ip_mac': ipMac,
        'customer_name': customerName,
        'customer_phone': customerPhone,
        'rooms': rooms,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      ipMac,
      customerName,
      customerPhone,
      rooms,
    ];
  }
}
