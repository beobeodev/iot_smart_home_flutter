import 'package:get/get.dart';
import 'package:iot_smart_home/dependency_injection.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/add_room_to_rasp.usecase.dart';
import 'package:iot_smart_home/modules/room/controllers/create_room.controller.dart';
import 'package:iot_smart_home/modules/root/controllers/root.controller.dart';

class CreateRoomBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateRoomController(
        addRoomToRaspUseCase: getIt.get<AddRoomToRaspUseCase>(),
        rootController: Get.find<RootController>()));
  }
}
