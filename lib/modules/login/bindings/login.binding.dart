import 'package:get/get.dart';
import 'package:iot_smart_home/dependency_injection.dart';
import 'package:iot_smart_home/domain/usecases/login.usecase.dart';
import 'package:iot_smart_home/modules/login/controllers/login.controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
        () => LoginController(loginUseCase: getIt.get<LoginUseCase>()));
  }
}