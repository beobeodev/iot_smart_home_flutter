import 'package:iot_smart_home/domain/entities/dht11.entity.dart';
import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';
import 'package:iot_smart_home/domain/entities/room.entity.dart';

abstract class IRaspberryRepository {
  Future<RaspberryEntity> getRaspberryByIpMac(String ipMac);
  Future<RoomEntity> addRoomToRasp(Map<String, dynamic> formBody);
  Future<Map<String, dynamic>> controlDigitalDevice(
    Map<String, dynamic> formBody,
  );
  Future<Map<String, dynamic>> predictBySpeech(
    Map<String, dynamic> formBody,
  );
  Future<DHT11Entity> getTempAndHuman();
}
