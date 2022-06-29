class DeviceEntity {
  String id;
  String name;
  int? gate;
  bool status;

  DeviceEntity({
    required this.id,
    required this.name,
    this.gate,
    this.status = false,
  });

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

  DeviceEntity copyWith({String? id, String? name, int? gate, bool? status}) {
    return DeviceEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      gate: gate ?? this.gate,
      status: status ?? this.status,
    );
  }
}
