import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/core/constants/font_family.dart';
import 'package:iot_smart_home/core/resouces/request_state.dart';
import 'package:iot_smart_home/core/router/route_manager.dart';
import 'package:iot_smart_home/core/utils/http/exceptions.dart';
import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';
import 'package:iot_smart_home/domain/usecases/authentication/authentication.usecase.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/save_ip_mac.usecase.dart';
import 'package:iot_smart_home/generated/locales.g.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;
  final SetLoggedInUseCase setLoggedInUseCase;
  final SaveIpMacUseCase saveIpMacUseCase;

  LoginController(
      {required this.loginUseCase,
      required this.setLoggedInUseCase,
      required this.saveIpMacUseCase});

  final TextEditingController ipController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final RxBool isProcessing = false.obs;

  Future<void> login() async {
    // Get.offAllNamed(RouteManager.root);
    if (isProcessing.value) {
      return;
    }
    isProcessing.value = true;
    final Map<String, dynamic> formData = {
      'username': ipController.text,
      'password': passController.text,
    };

    final RequestState<RaspberryEntity> state =
        await loginUseCase.execute(params: formData);

    if (state is RequestFailed<RaspberryEntity>) {
      handleError(state);
    } else if (state is RequestSuccess<RaspberryEntity>) {
      setLoggedInUseCase.execute();
      saveIpMacUseCase.execute(params: state.data!.ipMac);
      Get.offAllNamed(RouteManager.root, arguments: state.data);
    }

    isProcessing.value = false;
  }

  void handleError(RequestFailed<RaspberryEntity> state) {
    log(state.error.toString());
    if (state.error is UnauthorisedException) {
      Get.snackbar('', '',
          icon: const Icon(Icons.warning, color: Colors.yellow),
          snackPosition: SnackPosition.BOTTOM,
          borderColor: Colors.red,
          borderWidth: 1,
          backgroundColor: Colors.white,
          borderRadius: 10,
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.symmetric(vertical: 5),
          colorText: Colors.red,
          duration: const Duration(seconds: 4),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          forwardAnimationCurve: Curves.easeOutBack,
          messageText: Text(
            LocaleKeys.error_incorrect_ip_password.tr,
            style: TextStyle(
                fontFamily: FontFamily.fontMulish,
                fontSize: 17.sp,
                color: Colors.red),
          ),
          titleText: Text(
            LocaleKeys.text_warning.tr,
            style: TextStyle(
                fontFamily: FontFamily.fontMulish,
                fontWeight: FontWeight.w800,
                fontSize: 17.sp,
                color: Colors.red),
          ));
    }
  }
}
