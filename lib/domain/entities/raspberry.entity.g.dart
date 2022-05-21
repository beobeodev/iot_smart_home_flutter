// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raspberry.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaspberryEntity _$RaspberryEntityFromJson(Map<String, dynamic> json) =>
    RaspberryEntity(
      ipMac: json['ipMac'] as String,
      customerName: json['customerName'] as String?,
      customerPhone: json['customerPhone'] as String?,
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => RoomEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RaspberryEntityToJson(RaspberryEntity instance) =>
    <String, dynamic>{
      'ipMac': instance.ipMac,
      'customerName': instance.customerName,
      'customerPhone': instance.customerPhone,
      'rooms': instance.rooms,
    };
