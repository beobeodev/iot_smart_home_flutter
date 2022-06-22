class DeviceEntity {
  String name;
  int? gate;
  bool status;

  DeviceEntity({required this.name, this.gate, this.status = false});

  // factory DeviceEntity.fromJson(Map<String, dynamic> json) {
  //   return DeviceEntity(
  //     name: json['name'] as String,
  //     gate: json['gate'] as int,
  //     status: json['status'] as bool,
  //   );
  // }

  Map<String, dynamic> toJson() => {
        'name': name,
        'gate': gate,
        'status': status,
      };

  DeviceEntity copyWith({String? name, int? gate, bool? status}) {
    return DeviceEntity(
        name: name ?? this.name,
        gate: gate ?? this.gate,
        status: status ?? this.status);
  }
}
