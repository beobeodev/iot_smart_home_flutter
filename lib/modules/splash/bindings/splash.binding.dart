import 'package:get/get.dart';
import 'package:iot_smart_home/dependency_injection.dart';
import 'package:iot_smart_home/domain/usecases/authentication/authentication.usecase.dart';
import 'package:iot_smart_home/modules/splash/controllers/splash.controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(
        checkLoggedInUseCase: getIt.get<CheckLoggedInUseCase>()));
  }
}
