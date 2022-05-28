import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/domain/entities/raspberry.entity.dart';
import 'package:unicons/unicons.dart';

class RootController extends GetxController {
  final Rx<RaspberryEntity> raspberryEntity =
      (Get.arguments as RaspberryEntity).obs;

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
}
