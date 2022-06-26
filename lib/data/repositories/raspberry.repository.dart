import 'package:iot_smart_home/core/utils/dio/dio_provider.dart';
import 'package:iot_smart_home/data/datasources/remote/raspberry.datasource.dart';
import 'package:iot_smart_home/data/models/dht11.model.dart';
import 'package:iot_smart_home/data/models/raspberry.model.dart';
import 'package:iot_smart_home/data/models/room.model.dart';
import 'package:iot_smart_home/domain/repositories/iraspberry.repository.dart';

class RaspberryRepository extends IRaspberryRepository {
  final RaspberryRemoteDatasource remoteDatasource;

  RaspberryRepository({required this.remoteDatasource});

  @override
  Future<RaspberryModel> getRaspberryByIpMac(String ipMac) async {
    final HttpRequestResponse getRaspResponse =
        await remoteDatasource.getRaspberryByIpMac(ipMac);

    return RaspberryModel.fromJson(getRaspResponse.data);
  }

  @override
  Future<RoomModel> addRoomToRasp(
    Map<String, dynamic> formBody,
  ) async {
    final HttpRequestResponse addRoomResponse =
        await remoteDatasource.addRoomToRasp(formBody);

    return RoomModel.fromJson(addRoomResponse.data);
  }

  @override
  Future<Map<String, dynamic>> controlDigitalDevice(
    Map<String, dynamic> formBody,
  ) async {
    final HttpRequestResponse controlResponse =
        await remoteDatasource.controlDigitalDevice(formBody);

    return controlResponse.data;
  }

  @override
  Future<Map<String, dynamic>> predictBySpeech(
    Map<String, dynamic> formBody,
  ) async {
    final HttpRequestResponse predictResponse =
        await remoteDatasource.predictBySpeech(formBody);

    return predictResponse.data;
  }

  @override
  Future<DHT11Model> getTempAndHuman() async {
    final HttpRequestResponse dht11Response =
        await remoteDatasource.getTempAndHuman();

    return DHT11Model.fromJson(dht11Response.data);
  }
}
