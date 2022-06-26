import 'dart:developer';

import 'package:get/get.dart';
import 'package:iot_smart_home/core/router/route_manager.dart';
import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';
import 'package:iot_smart_home/domain/usecases/authentication/check_logged_in.usecase.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/get_ip_mac.usecase.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/get_raspberry_by_ipmac.usecase.dart';

class SplashController extends GetxController {
  final CheckLoggedInUseCase checkLoggedInUseCase;
  final GetIpMacUseCase getIpMacUseCase;
  final GetRaspberryByIpMacUseCase getRaspberryByIpMacUseCase;

  SplashController({
    required this.checkLoggedInUseCase,
    required this.getIpMacUseCase,
    required this.getRaspberryByIpMacUseCase,
  });

  @override
  void onReady() async {
    super.onReady();
    await handleDirect();
  }

  Future<void> handleDirect() async {
    final bool? isLogged = await checkLoggedInUseCase.execute();
    if (isLogged == null || !isLogged) {
      Get.offAllNamed(RouteManager.login);
    } else {
      Get.offAllNamed(RouteManager.root);
    }
  }

  Future<void> getData() async {
    final String? ipMac = await getIpMacUseCase.execute();

    try {
      final RaspberryEntity raspberryState =
          await getRaspberryByIpMacUseCase.execute(params: ipMac!);
    } catch (e) {
      log('Error in getData() from SplashController()');
    }
  }
}
