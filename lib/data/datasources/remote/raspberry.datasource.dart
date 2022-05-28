import 'package:iot_smart_home/core/utils/http/http_provider.dart';
import 'package:iot_smart_home/data/models/raspberry.model.dart';

abstract class IRaspberryDatasource {
  Future<RaspberryModel> getRaspberryByIpMac(String ipMac);
}

class RaspberryDatasource implements IRaspberryDatasource {
  @override
  Future<RaspberryModel> getRaspberryByIpMac(String ipMac) async {
    final dynamic rawData = await HttpProvider.get('/ras/$ipMac');
    return RaspberryModel.fromJson(rawData);
  }
}
