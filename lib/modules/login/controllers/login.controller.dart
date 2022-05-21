import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/core/resouces/request_state.dart';
import 'package:iot_smart_home/core/router/route_manager.dart';
import 'package:iot_smart_home/core/utils/http/exceptions.dart';
import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';
import 'package:iot_smart_home/domain/usecases/login.usecase.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController({required this.loginUseCase});

  final TextEditingController ipController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  Future<void> login() async {
    final Map<String, dynamic> formData = {
      'username': ipController.text,
      'password': passController.text,
    };

    final RequestState<RaspberryEntity> state =
        await loginUseCase.execute(params: formData);

    if (state is RequestFailed<RaspberryEntity>) {
      handleError(state);
    } else {
      Get.offAllNamed(RouteManager.root);
    }
  }

  void handleError(RequestFailed<RaspberryEntity> state) {
    if (state.error is UnauthorisedException) {}
  }
}
