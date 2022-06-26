import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';
import 'package:iot_smart_home/domain/repositories/iauthentication.repository.dart';
import 'package:iot_smart_home/domain/usecases/use_case.dart';

class LoginUseCase implements UseCase<RaspberryEntity, Map<String, dynamic>> {
  final IAuthenticationRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<RaspberryEntity> execute({
    Map<String, dynamic> params = const {},
  }) async {
    return await repository.login(params);
  }
}
