// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceEntity _$DeviceEntityFromJson(Map<String, dynamic> json) => DeviceEntity(
      name: json['name'] as String,
      gate: json['gate'] as int,
      status: json['status'] as bool? ?? false,
    );

Map<String, dynamic> _$DeviceEntityToJson(DeviceEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gate': instance.gate,
      'status': instance.status,
    };
