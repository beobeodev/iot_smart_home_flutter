import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_smart_home/core/theme/palette.dart';
import 'package:iot_smart_home/modules/favorite/views/favorite_screen.dart';
import 'package:iot_smart_home/modules/home/home_screen.dart';
import 'package:iot_smart_home/modules/profile/views/profile_screen.dart';
import 'package:iot_smart_home/modules/room/views/room_screen.dart';
import 'package:unicons/unicons.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: const [
          HomeScreen(),
          RoomScreen(),
          FavoriteScreen(),
          ProfileScreen()
        ],
      ),
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
                (index) => const Icon(
                      UniconsLine.home_alt,
                      color: Palette.blue300,
                    ))),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
