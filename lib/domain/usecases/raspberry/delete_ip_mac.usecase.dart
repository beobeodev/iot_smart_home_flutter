import 'package:iot_smart_home/domain/repositories/ihive_local.repository.dart';
import 'package:iot_smart_home/domain/usecases/use_case.dart';

class DeleteIpMacUseCase extends UseCase<void, String?> {
  final IHiveLocalRepository repository;

  DeleteIpMacUseCase({required this.repository});

  @override
  Future<void> execute({String? params}) async {
    return await repository.deleteIpMac();
  }
}
