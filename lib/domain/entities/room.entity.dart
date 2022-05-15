import 'package:equatable/equatable.dart';
import 'package:iot_smart_home/domain/entities/device.entity.dart';

class RoomEntity extends Equatable {
  final String name;
  final List<DeviceEntity>? devices;

  const RoomEntity({required this.name, this.devices});

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [name, devices];
}
