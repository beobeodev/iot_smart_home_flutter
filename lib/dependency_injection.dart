import 'package:get_it/get_it.dart';
import 'package:iot_smart_home/data/datasources/local/hive_local.datasource.dart';
import 'package:iot_smart_home/data/datasources/remote/authentication.datasouce.dart';
import 'package:iot_smart_home/data/repositories/authentication.repository.dart';
import 'package:iot_smart_home/data/repositories/hive_local.repository.dart';
import 'package:iot_smart_home/domain/usecases/authentication/check_logged_in.usecase.dart';
import 'package:iot_smart_home/domain/usecases/authentication/login.usecase.dart';
import 'package:iot_smart_home/domain/usecases/authentication/set_logged_in.usecase.dart';

final GetIt getIt = GetIt.instance;

void initDependencies() {
  getIt.registerLazySingleton(() => AuthenticationDatasouce());

  getIt.registerLazySingleton(() => AuthenticationRepository(
      authenticationDatasouce: getIt.get<AuthenticationDatasouce>()));

  // HIVE LOCAL DATABASE
  getIt.registerLazySingleton(() => HiveLocalDatatasource());

  getIt.registerLazySingleton(() =>
      HiveLocalRepository(datatasource: getIt.get<HiveLocalDatatasource>()));

  getIt.registerLazySingleton(
      () => SetLoggedInUseCase(repository: getIt.get<HiveLocalRepository>()));
  getIt.registerLazySingleton(
      () => CheckLoggedInUseCase(repository: getIt.get<HiveLocalRepository>()));

  getIt.registerLazySingleton(
      () => LoginUseCase(repository: getIt.get<AuthenticationRepository>()));
}
