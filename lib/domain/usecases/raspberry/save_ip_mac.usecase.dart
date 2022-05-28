import 'package:iot_smart_home/domain/repositories/ihive_local.repository.dart';
import 'package:iot_smart_home/domain/usecases/use_case.dart';

class SaveIpMacUseCase extends UseCase<void, String> {
  final IHiveLocalRepository repository;

  SaveIpMacUseCase({required this.repository});

  @override
  Future<void> execute({String params = ''}) async {
    await repository.saveIpMac(params);
  }
}
