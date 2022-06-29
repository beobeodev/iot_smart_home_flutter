import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/core/router/route_manager.dart';
import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';
import 'package:iot_smart_home/domain/usecases/authentication/authentication.usecase.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/set_ip_mac.usecase.dart';
import 'package:iot_smart_home/modules/root/controllers/manager.controller.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;
  final SetIpMacUseCase setIpMacUseCase;
  final ManagerController managerController;

  LoginController({
    required this.loginUseCase,
    required this.setIpMacUseCase,
    required this.managerController,
  });

  final TextEditingController ipController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  // Validate login form
  final GlobalKey<FormState> loginFormKey = GlobalKey();
  RxString errorText = ''.obs;

  final RxBool isProcessing = false.obs;

  String? validateIp(String? value) {
    if (value == '') {
      return 'Vui lòng nhập tài khoản';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == '') {
      return 'Vui lòng nhập mật khẩu';
    }
    return null;
  }

  Future<void> login() async {
    // Get.offAllNamed(RouteManager.root);
    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    if (isProcessing.value) {
      return;
    }

    isProcessing.value = true;

    final Map<String, dynamic> formData = {
      'username': ipController.text,
      'password': passController.text,
    };

    try {
      final RaspberryEntity raspberryEntity =
          await loginUseCase.execute(params: formData);

      await saveDataAfterLogin(raspberryEntity);

      managerController.setRaspberry(raspberryEntity);

      Get.offAllNamed(RouteManager.root);
    } catch (e) {
      log('Error in login() from LoginController: $e');
    }

    isProcessing.value = false;
  }

  Future<void> saveDataAfterLogin(RaspberryEntity raspberryEntity) async {
    await setIpMacUseCase.execute(params: raspberryEntity.ipMac);
  }
}
