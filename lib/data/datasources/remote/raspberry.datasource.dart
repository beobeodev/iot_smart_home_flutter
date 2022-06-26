import 'package:iot_smart_home/core/utils/dio/dio_provider.dart';

abstract class IRaspberryRemoteDatasource {
  Future<HttpRequestResponse> getRaspberryByIpMac(String ipMac);
  Future<HttpRequestResponse> addRoomToRasp(Map<String, dynamic> formBody);
  Future<HttpRequestResponse> controlDigitalDevice(
    Map<String, dynamic> formBody,
  );

  Future<HttpRequestResponse> predictBySpeech(Map<String, dynamic> formBody);
  Future<HttpRequestResponse> getTempAndHuman();
}

class RaspberryRemoteDatasource implements IRaspberryRemoteDatasource {
  @override
  Future<HttpRequestResponse> getRaspberryByIpMac(String ipMac) async {
    return await DioProvider.get(url: '/ras/$ipMac');
  }

  @override
  Future<HttpRequestResponse> addRoomToRasp(
    Map<String, dynamic> formBody,
  ) async {
    return await DioProvider.patch(url: '/ras/add_room', formBody: formBody);
  }

  @override
  Future<HttpRequestResponse> controlDigitalDevice(
    Map<String, dynamic> formBody,
  ) async {
    return await DioProvider.post(
      url: '/api/control_digital',
      formBody: formBody,
    );
  }

  @override
  Future<HttpRequestResponse> predictBySpeech(
    Map<String, dynamic> formBody,
  ) async {
    return await DioProvider.post(url: '/api/ras_predict', formBody: formBody);
  }

  @override
  Future<HttpRequestResponse> getTempAndHuman() async {
    return await DioProvider.get(url: '/api/get_temp_and_humi');
  }
}
