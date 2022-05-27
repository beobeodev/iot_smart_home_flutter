import 'package:iot_smart_home/domain/repositories/ihive_local.repository.dart';
import 'package:iot_smart_home/domain/usecases/use_case.dart';

class SetLoggedInUseCase extends UseCase<void, bool> {
  final IHiveLocalRepository repository;

  SetLoggedInUseCase({required this.repository});

  @override
  Future<void> execute({bool params = true}) async {
    await repository.setLoggedIn(params);
  }
}
