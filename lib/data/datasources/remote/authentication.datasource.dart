import 'package:iot_smart_home/core/utils/dio/dio_provider.dart';

class AuthenticationRemoteDatasource {
  Future<HttpRequestResponse> login(Map<String, dynamic> formBody) async {
    return await DioProvider.post(url: '/auth/login', formBody: formBody);
    // return RaspberryModel.fromJson(rawData);
  }
}
