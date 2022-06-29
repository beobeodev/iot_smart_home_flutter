import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/core/utils/authorization.util.dart';
import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';
import 'package:iot_smart_home/domain/entities/room.entity.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/raspberry.usecase.dart';
import 'package:iot_smart_home/modules/root/controllers/manager.controller.dart';
import 'package:unicons/unicons.dart';

class RootController extends GetxController {
  final GetRaspberryByIpMacUseCase getRaspberryByIpMacUseCase;
  final ManagerController managerController;

  RootController({
    required this.getRaspberryByIpMacUseCase,
    required this.managerController,
  });

  late Rx<RaspberryEntity> _currentRaspberry =
      (managerController.currentRaspberry).obs;
  RaspberryEntity get currentRaspberry => _currentRaspberry.value;

  final List<IconData> iconTabs = [
    UniconsLine.home_alt,
    UniconsLine.bed_double,
    UniconsLine.favorite,
    UniconsLine.user
  ];
  final RxInt _currentTabIndex = 0.obs;
  int get currentTabIndex => _currentTabIndex.value;

  @override
  Future<void> onInit() async {
    await getData();
    super.onInit();
  }

  Future<void> getData() async {
    try {
      final RaspberryEntity raspberry = await getRaspberryByIpMacUseCase
          .execute(params: AuthorizationUtil.ipMac);

      _currentRaspberry = raspberry.obs;
      log('getData()');
    } catch (e) {
      log('Error in getData() from RootController()');
    }
  }

  void onPressTab(int tabIndex) {
    _currentTabIndex.value = tabIndex;
  }

  void addRoomToRasp(RoomEntity newRoom) {
    _currentRaspberry.value.rooms.add(newRoom);
  }
}
