import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/core/constants/font_family.dart';
import 'package:iot_smart_home/core/theme/palette.dart';
import 'package:iot_smart_home/domain/entities/device.entity.dart';
import 'package:iot_smart_home/modules/home/controllers/home.controller.dart';
import 'package:unicons/unicons.dart';

class GridViewDevicesInRoom extends GetView<HomeController> {
  const GridViewDevicesInRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Phòng',
              style: TextStyle(
                  fontFamily: FontFamily.fontMulish,
                  fontWeight: FontWeight.w800,
                  fontSize: 20.sp,
                  color: Palette.darkCerulean500),
            ),
            SizedBox(
              width: 180.w,
              height: 50.h,
              child: DropdownButtonFormField(
                items: controller.rootController.currentRaspberry.rooms
                    .map((e) => DropdownMenuItem(
                          child: Text(e.name),
                          value: e.id,
                        ))
                    .toList(),
                value: controller.currentRoom.id,
                onChanged: controller.onChangeDropdownRoom,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                            width: 2, color: Palette.darkCerulean500))),
              ),
            )
          ],
        ),
        Obx(() => GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 16.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 60.w,
                mainAxisSpacing: 20.h),
            itemCount: controller.currentRoom.devices.length,
            itemBuilder: (context, index) {
              final DeviceEntity currentDevice =
                  controller.currentRoom.devices[index];

              return Container(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            child: Icon(
                              UniconsLine.lightbulb,
                              color: Palette.blue300,
                            ),
                            backgroundColor: Palette.aliceBlue,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.changeDigitalDevice(index);
                            },
                            child: Container(
                              width: 50.w,
                              height: 30.h,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.h),
                                color: currentDevice.status
                                    ? Palette.blue400
                                    : Palette.cultured,
                              ),
                              child: Row(children: [
                                currentDevice.status
                                    ? const Spacer()
                                    : const SizedBox(),
                                Container(
                                  width: 25.w,
                                  height: 25.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(25.w)),
                                )
                              ]),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        currentDevice.name,
                        style: TextStyle(
                            color: Palette.blue500,
                            fontFamily: FontFamily.fontMulish,
                            fontWeight: FontWeight.w800,
                            fontSize: 18.sp),
                      )
                    ]),
                decoration: BoxDecoration(
                    color: Palette.lightGray,
                    borderRadius: BorderRadius.circular(10.w)),
              );
            }))
      ],
    );
  }
}
