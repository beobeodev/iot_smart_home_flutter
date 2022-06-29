import 'package:get/get.dart';
import 'package:iot_smart_home/dependency_injection.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/get_raspberry_by_ipmac.usecase.dart';
import 'package:iot_smart_home/modules/root/controllers/manager.controller.dart';
import 'package:iot_smart_home/modules/root/controllers/root.controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RootController(
        getRaspberryByIpMacUseCase: getIt.get<GetRaspberryByIpMacUseCase>(),
        managerController: Get.find<ManagerController>(),
      ),
    );
  }
}
