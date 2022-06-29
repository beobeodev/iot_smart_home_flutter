import 'package:get_it/get_it.dart';
import 'package:iot_smart_home/data/datasources/local/hive_local.datasource.dart';
import 'package:iot_smart_home/data/datasources/remote/authentication.datasource.dart';
import 'package:iot_smart_home/data/datasources/remote/raspberry.datasource.dart';
import 'package:iot_smart_home/data/repositories/authentication.repository.dart';
import 'package:iot_smart_home/data/repositories/hive_local.repository.dart';
import 'package:iot_smart_home/data/repositories/raspberry.repository.dart';
import 'package:iot_smart_home/domain/usecases/authentication/login.usecase.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/raspberry.usecase.dart';

final GetIt getIt = GetIt.instance;

void initDependencies() {
  // AUTHENTICATION
  getIt.registerLazySingleton(() => AuthenticationRemoteDatasource());
  getIt.registerLazySingleton(
    () => AuthenticationRepository(
      datasource: getIt.get<AuthenticationRemoteDatasource>(),
    ),
  );

  // HIVE LOCAL DATABASE
  getIt.registerLazySingleton(() => HiveLocalDatatasource());
  getIt.registerLazySingleton(
    () => HiveLocalRepository(datatasource: getIt.get<HiveLocalDatatasource>()),
  );

  // RASPBERRY
  getIt.registerLazySingleton(() => RaspberryRemoteDatasource());
  getIt.registerLazySingleton(
    () => RaspberryRepository(
      remoteDatasource: getIt.get<RaspberryRemoteDatasource>(),
    ),
  );

  // USE CASES
  getIt.registerLazySingleton(
    () => LoginUseCase(repository: getIt.get<AuthenticationRepository>()),
  );

  getIt.registerLazySingleton(
    () => SetIpMacUseCase(repository: getIt.get<HiveLocalRepository>()),
  );
  getIt.registerLazySingleton(
    () => GetIpMacUseCase(repository: getIt.get<HiveLocalRepository>()),
  );
  getIt.registerLazySingleton(
    () => DeleteIpMacUseCase(repository: getIt.get<HiveLocalRepository>()),
  );

  getIt.registerLazySingleton(
    () => GetRaspberryByIpMacUseCase(
      repository: getIt.get<RaspberryRepository>(),
    ),
  );
  getIt.registerLazySingleton(
    () => AddRoomToRaspUseCase(repository: getIt.get<RaspberryRepository>()),
  );
  getIt.registerLazySingleton(
    () => ControlDigitalDeviceUseCase(
      repository: getIt.get<RaspberryRepository>(),
    ),
  );

  getIt.registerLazySingleton(
    () => PredictBySpeechUseCase(repository: getIt.get<RaspberryRepository>()),
  );

  getIt.registerLazySingleton(
    () => GetTempAndHumanUseCase(repository: getIt.get<RaspberryRepository>()),
  );
}
