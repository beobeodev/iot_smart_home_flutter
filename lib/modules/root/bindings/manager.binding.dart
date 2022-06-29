import 'package:get/get.dart';
import 'package:iot_smart_home/dependency_injection.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/raspberry.usecase.dart';
import 'package:iot_smart_home/modules/root/controllers/manager.controller.dart';

class ManagerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ManagerController(
        getRaspberryByIpMacUseCase: getIt.get<GetRaspberryByIpMacUseCase>(),
      ),
      permanent: true,
    );
  }
}
