import 'package:iot_smart_home/core/utils/http/http_provider.dart';
import 'package:iot_smart_home/data/models/raspberry.model.dart';

class AuthenticationDatasource {
  Future<RaspberryModel> login(Map<String, dynamic> formBody) async {
    final dynamic rawData = await HttpProvider.post('/auth/login', formBody);
    return RaspberryModel.fromJson(rawData);
  }
}
