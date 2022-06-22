import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/core/constants/asset_path.dart';
import 'package:iot_smart_home/core/constants/font_family.dart';
import 'package:iot_smart_home/core/router/route_manager.dart';
import 'package:iot_smart_home/core/theme/palette.dart';
import 'package:iot_smart_home/domain/entities/room.entity.dart';
import 'package:iot_smart_home/modules/room/controllers/room.controller.dart';
import 'package:unicons/unicons.dart';

class RoomScreen extends GetView<RoomController> {
  const RoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).padding.top + 10, 0, 80.h),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Palette.yellow200.withOpacity(0.4),
                  Palette.ghostWhite
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.3])),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45.h,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 6),
                          blurRadius: 12)
                    ]),
                    child: TextField(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: const Icon(
                          UniconsLine.search,
                          color: Palette.blue500,
                        ),
                        hintText: 'Nhập tên phòng cần tìm',
                        hintStyle: TextStyle(
                            fontFamily: FontFamily.fontMulish,
                            fontSize: 16.sp,
                            color: Palette.lightGray),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(60),
                            borderSide: BorderSide.none),
                      ),
                      style: TextStyle(
                        color: Palette.darkCerulean500,
                        fontSize: 16.sp,
                        fontFamily: FontFamily.fontMulish,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(RouteManager.createRoom);
                  },
                  child: const Icon(
                    UniconsLine.plus,
                    color: Palette.blue500,
                  ),
                  style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      elevation: 5.0,
                      minimumSize: Size(45.h, 45.h)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                shrinkWrap: true,
                itemCount:
                    controller.rootController.currentRaspberry.rooms.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                // clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  final RoomEntity currentRoom =
                      controller.rootController.currentRaspberry.rooms[index];

                  return Container(
                    width: double.infinity,
                    height: 145.h,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(0, 3),
                              blurRadius: 12)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(15)),
                          child: Image.asset(AssetPath.imageRealityRoom)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 15.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currentRoom.name,
                                style: TextStyle(
                                    fontFamily: FontFamily.fontMulish,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 19.sp,
                                    color: Palette.darkCerulean500)),
                            Text('${currentRoom.devices.length} thiết bị',
                                style: TextStyle(
                                    fontFamily: FontFamily.fontMulish,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: Palette.outerSpace200))
                          ],
                        ),
                      )
                    ]),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
