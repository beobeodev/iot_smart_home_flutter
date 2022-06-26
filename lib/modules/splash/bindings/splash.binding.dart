import 'package:get/get.dart';
import 'package:iot_smart_home/dependency_injection.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/get_ip_mac.usecase.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/get_raspberry_by_ipmac.usecase.dart';
import 'package:iot_smart_home/modules/splash/controllers/splash.controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(
      SplashController(
        getIpMacUseCase: getIt.get<GetIpMacUseCase>(),
        getRaspberryByIpMacUseCase: getIt.get<GetRaspberryByIpMacUseCase>(),
      ),
    );
  }
}
