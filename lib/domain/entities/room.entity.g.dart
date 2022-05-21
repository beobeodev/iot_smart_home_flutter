// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomEntity _$RoomEntityFromJson(Map<String, dynamic> json) => RoomEntity(
      name: json['name'] as String,
      devices: (json['devices'] as List<dynamic>?)
          ?.map((e) => DeviceEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomEntityToJson(RoomEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'devices': instance.devices,
    };
