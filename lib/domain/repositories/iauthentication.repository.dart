import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';

abstract class IAuthenticationRepository {
  Future<RaspberryEntity> login(Map<String, dynamic> formBody);
}
