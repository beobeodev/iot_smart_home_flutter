import 'package:get/get.dart';
import 'package:iot_smart_home/dependency_injection.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/control_digital_device.usecase.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/get_temp_human.usecase.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/predict_by_speech.usecase.dart';
import 'package:iot_smart_home/modules/home/controllers/home.controller.dart';
import 'package:iot_smart_home/modules/root/controllers/root.controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        rootController: Get.find<RootController>(),
        controlDigitalDeviceUseCase: getIt.get<ControlDigitalDeviceUseCase>(),
        predictBySpeechUseCase: getIt.get<PredictBySpeechUseCase>(),
        getTempAndHumanUseCase: getIt.get<GetTempAndHumanUseCase>(),
      ),
    );
  }
}
