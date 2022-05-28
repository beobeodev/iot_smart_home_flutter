import 'package:iot_smart_home/core/resouces/request_state.dart';
import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';

abstract class IRaspberryRepository {
  Future<RequestState<RaspberryEntity>> getRaspberryByIpMac(String ipMac);
}
