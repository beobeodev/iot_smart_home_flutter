import 'dart:developer';

import 'package:get/get.dart';
import 'package:iot_smart_home/core/router/route_manager.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/raspberry.usecase.dart';

class ProfileController extends GetxController {
  final DeleteIpMacUseCase deleteIpMacUseCase;

  ProfileController({required this.deleteIpMacUseCase});

  Future<void> logout() async {
    try {
      await deleteIpMacUseCase.execute();
      Get.offAllNamed(RouteManager.login);
    } catch (e) {
      log('Error in logout() from ProfileController: $e');
    }
  }
}
