import 'package:get_it/get_it.dart';
import 'package:iot_smart_home/data/datasources/remote/authentication.datasouce.dart';
import 'package:iot_smart_home/data/repositories/authentication_iml.repository.dart';
import 'package:iot_smart_home/domain/usecases/login.usecase.dart';

final GetIt getIt = GetIt.instance;

void initDependencies() {
  getIt.registerLazySingleton(() => AuthenticationDatasouce());

  getIt.registerLazySingleton(() => AuthenticationImlRepository(
      authenticationDatasouce: getIt.get<AuthenticationDatasouce>()));

  getIt.registerLazySingleton(
      () => LoginUseCase(repository: getIt.get<AuthenticationImlRepository>()));
}
