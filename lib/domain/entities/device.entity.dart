import 'package:equatable/equatable.dart';

class DeviceEntity extends Equatable {
  final String name;
  final int gate;
  final bool? status;

  const DeviceEntity(
      {required this.name, required this.gate, this.status = false});

  factory DeviceEntity.fromJson(Map<String, dynamic> json) {
    return DeviceEntity(
      name: json['name'] as String,
      gate: json['gate'] as int,
      status: json['status'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'gate': gate,
        'status': status,
      };

  @override
  List<Object?> get props => [name, gate, status];

  @override
  bool? get stringify => true;
}
