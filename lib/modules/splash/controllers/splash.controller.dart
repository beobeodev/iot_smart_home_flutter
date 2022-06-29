import 'dart:developer';

import 'package:get/get.dart';
import 'package:iot_smart_home/core/router/route_manager.dart';
import 'package:iot_smart_home/core/utils/authorization.util.dart';
import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/raspberry.usecase.dart';
import 'package:iot_smart_home/modules/root/controllers/manager.controller.dart';

class SplashController extends GetxController {
  final GetIpMacUseCase getIpMacUseCase;
  final GetRaspberryByIpMacUseCase getRaspberryByIpMacUseCase;
  final ManagerController managerController;

  SplashController({
    required this.getIpMacUseCase,
    required this.getRaspberryByIpMacUseCase,
    required this.managerController,
  });

  @override
  Future<void> onReady() async {
    super.onReady();
    await handleDirect();
  }

  Future<void> handleDirect() async {
    final String? ipMac = await getIpMacUseCase.execute();
    if (ipMac == null) {
      Get.offAllNamed(RouteManager.login);
    } else {
      AuthorizationUtil.ipMac = ipMac;
      // await getData();
      await managerController.getData();
      Get.offAllNamed(RouteManager.root);
    }
  }

  Future<void> getData() async {
    try {
      final RaspberryEntity raspberry = await getRaspberryByIpMacUseCase
          .execute(params: AuthorizationUtil.ipMac);

      managerController.currentRaspberry = raspberry;
      // _currentRaspberry = raspberry.obs;
      Get.offAllNamed(RouteManager.root, arguments: raspberry);
    } catch (e) {
      log('Error in getData() from RootController()');
    }
  }
}
