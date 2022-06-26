import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';
import 'package:iot_smart_home/domain/entities/room.entity.dart';
import 'package:unicons/unicons.dart';

class RootController extends GetxController {
  final Rx<RaspberryEntity> _currentRaspberry =
      (Get.arguments as RaspberryEntity).obs;
  RaspberryEntity get currentRaspberry => _currentRaspberry.value;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  // Future<void> getData() async {
  //   final String? ipMac = await getIpMacUseCase.execute();

  //   try {
  //     final RaspberryEntity raspberryState =
  //         await getRaspberryByIpMacUseCase.execute(params: ipMac!);
  //   } catch (e) {
  //     log('Error in getData() from SplashController()');
  //   }
  // }

  final List<IconData> iconTabs = [
    UniconsLine.home_alt,
    UniconsLine.bed_double,
    UniconsLine.favorite,
    UniconsLine.user
  ];

  final RxInt _currentTabIndex = 0.obs;
  int get currentTabIndex => _currentTabIndex.value;

  void onPressTab(int tabIndex) {
    _currentTabIndex.value = tabIndex;
  }

  void addRoomToRasp(RoomEntity newRoom) {
    _currentRaspberry.value.rooms.add(newRoom);
  }
}
