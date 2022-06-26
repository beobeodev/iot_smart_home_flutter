import 'package:iot_smart_home/core/utils/http/http_provider.dart';
import 'package:iot_smart_home/data/models/dht11.model.dart';
import 'package:iot_smart_home/data/models/raspberry.model.dart';
import 'package:iot_smart_home/data/models/room.model.dart';

abstract class IRaspberryDatasource {
  Future<RaspberryModel> getRaspberryByIpMac(String ipMac);
  Future<RoomModel> addRoomToRasp(Map<String, dynamic> formBody);
  Future<Map<String, dynamic>> controlDigitalDevice(
      Map<String, dynamic> formBody);

  Future<Map<String, dynamic>> predictBySpeech(Map<String, dynamic> formBody);
  Future<DHT11Model> getTempAndHuman();
}

class RaspberryDatasource implements IRaspberryDatasource {
  @override
  Future<RaspberryModel> getRaspberryByIpMac(String ipMac) async {
    final dynamic rawData = await HttpProvider.get('/ras/$ipMac');
    return RaspberryModel.fromJson(rawData);
  }

  @override
  Future<RoomModel> addRoomToRasp(Map<String, dynamic> formBody) async {
    final dynamic rawData = await HttpProvider.patch('/ras/add_room', formBody);
    return RoomModel.fromJson(rawData);
  }

  @override
  Future<Map<String, dynamic>> controlDigitalDevice(
      Map<String, dynamic> formBody) async {
    final dynamic rawData =
        await HttpProvider.post('/api/control_digital', formBody);
    return rawData;
  }

  @override
  Future<Map<String, dynamic>> predictBySpeech(
      Map<String, dynamic> formBody) async {
    final Map<String, dynamic> rawData =
        await HttpProvider.post('/api/ras_predict', formBody);
    return rawData;
  }

  @override
  Future<DHT11Model> getTempAndHuman() async {
    final Map<String, dynamic> rawData =
        await HttpProvider.get('/api/get_temp_and_humi');
    return DHT11Model.fromJson(rawData);
  }
}
