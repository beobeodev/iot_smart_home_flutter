import 'package:get/get.dart';
import 'package:iot_smart_home/dependency_injection.dart';
import 'package:iot_smart_home/domain/usecases/authentication/login.usecase.dart';
import 'package:iot_smart_home/domain/usecases/authentication/set_logged_in.usecase.dart';
import 'package:iot_smart_home/modules/login/controllers/login.controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(
        loginUseCase: getIt.get<LoginUseCase>(),
        setLoggedInUseCase: getIt.get<SetLoggedInUseCase>()));
  }
}
