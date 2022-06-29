import 'dart:developer';

import 'package:iot_smart_home/core/utils/authorization.util.dart';
import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/raspberry.usecase.dart';

class ManagerController {
  final GetRaspberryByIpMacUseCase getRaspberryByIpMacUseCase;

  ManagerController({required this.getRaspberryByIpMacUseCase});

  late RaspberryEntity currentRaspberry;

  Future<void> getData() async {
    try {
      final RaspberryEntity raspberry = await getRaspberryByIpMacUseCase
          .execute(params: AuthorizationUtil.ipMac);

      currentRaspberry = raspberry;
      // _currentRaspberry = raspberry.obs;
    } catch (e) {
      log('Error in getData() from RootController()');
    }
  }
}
