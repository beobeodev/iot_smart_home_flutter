import 'package:iot_smart_home/core/resouces/request_state.dart';
import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';
import 'package:iot_smart_home/domain/repositories/iraspberry.repository.dart';
import 'package:iot_smart_home/domain/usecases/use_case.dart';

class GetRaspberryByIpMacUseCase
    extends UseCase<RequestState<RaspberryEntity>, String> {
  final IRaspberryRepository repository;

  GetRaspberryByIpMacUseCase({required this.repository});

  @override
  Future<RequestState<RaspberryEntity>> execute({String params = ''}) async {
    return await repository.getRaspberryByIpMac(params);
  }
}
