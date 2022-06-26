import 'package:get_it/get_it.dart';
import 'package:iot_smart_home/data/datasources/local/hive_local.datasource.dart';
import 'package:iot_smart_home/data/datasources/remote/authentication.datasource.dart';
import 'package:iot_smart_home/data/datasources/remote/raspberry.datasource.dart';
import 'package:iot_smart_home/data/repositories/authentication.repository.dart';
import 'package:iot_smart_home/data/repositories/hive_local.repository.dart';
import 'package:iot_smart_home/data/repositories/raspberry.repository.dart';
import 'package:iot_smart_home/domain/usecases/authentication/check_logged_in.usecase.dart';
import 'package:iot_smart_home/domain/usecases/authentication/login.usecase.dart';
import 'package:iot_smart_home/domain/usecases/authentication/set_logged_in.usecase.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/add_room_to_rasp.usecase.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/control_digital_device.usecase.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/get_ip_mac.usecase.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/get_raspberry_by_ipmac.usecase.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/get_temp_human.usecase.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/predict_by_speech.usecase.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/save_ip_mac.usecase.dart';

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
    () => SetLoggedInUseCase(repository: getIt.get<HiveLocalRepository>()),
  );
  getIt.registerLazySingleton(
    () => CheckLoggedInUseCase(repository: getIt.get<HiveLocalRepository>()),
  );

  getIt.registerLazySingleton(
    () => SaveIpMacUseCase(repository: getIt.get<HiveLocalRepository>()),
  );
  getIt.registerLazySingleton(
    () => GetIpMacUseCase(repository: getIt.get<HiveLocalRepository>()),
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
