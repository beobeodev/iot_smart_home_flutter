import 'package:iot_smart_home/domain/repositories/ihive_local.repository.dart';
import 'package:iot_smart_home/domain/usecases/use_case.dart';

class CheckLoggedInUseCase implements UseCase<bool, dynamic> {
  final IHiveLocalRepository repository;

  CheckLoggedInUseCase({required this.repository});

  @override
  Future<bool> execute({dynamic params}) async {
    return await repository.checkNewUser();
  }
}
