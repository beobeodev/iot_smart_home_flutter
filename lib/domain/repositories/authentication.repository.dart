import 'package:iot_smart_home/core/resouces/request_state.dart';
import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';

abstract class AuthenticationRepository {
  Future<RequestState<RaspberryEntity>> login(Map<String, dynamic> formBody);
}
