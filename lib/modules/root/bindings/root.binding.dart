import 'package:get/get.dart';
import 'package:iot_smart_home/modules/root/controllers/root.controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootController());
  }
}
