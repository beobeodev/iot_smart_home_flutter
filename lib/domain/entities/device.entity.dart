import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device.entity.g.dart';

@JsonSerializable()
class DeviceEntity extends Equatable {
  final String name;
  final int gate;
  final bool? status;

  const DeviceEntity(
      {required this.name, required this.gate, this.status = false});

  @override
  List<Object?> get props => [name, gate, status];

  @override
  bool? get stringify => true;

  factory DeviceEntity.fromJson(Map<String, dynamic> json) =>
      _$DeviceEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceEntityToJson(this);
}
