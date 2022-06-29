import 'package:get/get.dart';
import 'package:iot_smart_home/dependency_injection.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/raspberry.usecase.dart';
import 'package:iot_smart_home/modules/profile/controllers/profile.controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileController(
        deleteIpMacUseCase: getIt.get<DeleteIpMacUseCase>(),
      ),
    );
  }
}
