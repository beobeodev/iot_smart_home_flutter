import 'package:get/get.dart';
import 'package:iot_smart_home/dependency_injection.dart';
import 'package:iot_smart_home/domain/usecases/authentication/login.usecase.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/set_ip_mac.usecase.dart';
import 'package:iot_smart_home/modules/login/controllers/login.controller.dart';
import 'package:iot_smart_home/modules/root/controllers/manager.controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        loginUseCase: getIt.get<LoginUseCase>(),
        setIpMacUseCase: getIt.get<SetIpMacUseCase>(),
        managerController: Get.find<ManagerController>(),
      ),
    );
  }
}
