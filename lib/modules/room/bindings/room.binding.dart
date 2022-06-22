import 'package:get/get.dart';
import 'package:iot_smart_home/modules/room/controllers/room.controller.dart';

class RoomBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoomController());
  }
}
