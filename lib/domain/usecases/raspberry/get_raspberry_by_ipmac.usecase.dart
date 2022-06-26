import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';
import 'package:iot_smart_home/domain/repositories/iraspberry.repository.dart';
import 'package:iot_smart_home/domain/usecases/use_case.dart';

class GetRaspberryByIpMacUseCase extends UseCase<RaspberryEntity, String> {
  final IRaspberryRepository repository;

  GetRaspberryByIpMacUseCase({required this.repository});

  @override
  Future<RaspberryEntity> execute({String params = ''}) async {
    return await repository.getRaspberryByIpMac(params);
  }
}
