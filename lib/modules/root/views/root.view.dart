import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/core/theme/palette.dart';
import 'package:iot_smart_home/modules/favorite/views/favorite_screen.dart';
import 'package:iot_smart_home/modules/home/home_screen.dart';
import 'package:iot_smart_home/modules/profile/views/profile_screen.dart';
import 'package:iot_smart_home/modules/room/views/room.view.dart';
import 'package:iot_smart_home/modules/root/controllers/root.controller.dart';

class RootScreen extends GetView<RootController> {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.currentTabIndex,
            children: const [
              HomeScreen(),
              RoomScreen(),
              FavoriteScreen(),
              ProfileScreen()
            ],
          )),
      floatingActionButton: Container(
        height: 50.h,
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Palette.darkCerulean300),
          borderRadius: BorderRadius.circular(50.h),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                4,
                (index) => Obx(() => IconButton(
                      onPressed: () {
                        controller.onPressTab(index);
                      },
                      padding: EdgeInsets.zero,
                      icon: Icon(controller.iconTabs[index]),
                      color: index == controller.currentTabIndex
                          ? Palette.yellow500
                          : Palette.blue300,
                    )))),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
