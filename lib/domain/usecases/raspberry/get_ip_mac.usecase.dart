import 'package:iot_smart_home/domain/repositories/ihive_local.repository.dart';
import 'package:iot_smart_home/domain/usecases/use_case.dart';

class GetIpMacUseCase extends UseCase<String?, dynamic> {
  final IHiveLocalRepository repository;

  GetIpMacUseCase({required this.repository});

  @override
  Future<String?> execute({dynamic params}) async {
    return await repository.getIpMac();
  }
}
