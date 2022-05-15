import 'package:get/get.dart';
import 'package:iot_smart_home/core/router/route_manager.dart';

class SplashController extends GetxController {
  Future<void> getData() async {
    await Future.delayed(const Duration(milliseconds: 300));
    Get.offAllNamed(RouteManager.login);
  }
}
