// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raspberry.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaspberryModel _$RaspberryModelFromJson(Map<String, dynamic> json) =>
    RaspberryModel(
      ipMac: json['ipMac'] as String,
      customerName: json['customerName'] as String?,
      customerPhone: json['customerPhone'] as String?,
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => RoomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RaspberryModelToJson(RaspberryModel instance) =>
    <String, dynamic>{
      'ipMac': instance.ipMac,
      'customerName': instance.customerName,
      'customerPhone': instance.customerPhone,
      'rooms': instance.rooms,
    };
