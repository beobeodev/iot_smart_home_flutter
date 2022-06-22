import 'package:iot_smart_home/core/resouces/request_state.dart';
import 'package:iot_smart_home/domain/entities/dht11.entity.dart';
import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';
import 'package:iot_smart_home/domain/entities/room.entity.dart';

abstract class IRaspberryRepository {
  Future<RequestState<RaspberryEntity>> getRaspberryByIpMac(String ipMac);
  Future<RequestState<RoomEntity>> addRoomToRasp(Map<String, dynamic> formBody);
  Future<RequestState<Map<String, dynamic>>> controlDigitalDevice(
      Map<String, dynamic> formBody);

  Future<RequestState<Map<String, dynamic>>> predictBySpeech(
      Map<String, dynamic> formBody);
  Future<RequestState<DHT11Entity>> getTempAndHuman();
}
