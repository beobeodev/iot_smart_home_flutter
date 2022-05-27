import 'package:iot_smart_home/core/resouces/request_state.dart';
import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';

abstract class IAuthenticationRepository {
  Future<RequestState<RaspberryEntity>> login(Map<String, dynamic> formBody);
}
