import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/core/constants/font_family.dart';
import 'package:iot_smart_home/core/theme/palette.dart';
import 'package:iot_smart_home/modules/home/controllers/home.controller.dart';
import 'package:iot_smart_home/modules/root/controllers/root.controller.dart';
import 'package:unicons/unicons.dart';

class GridViewDevicesInRoom extends GetView<HomeController> {
  final RootController _rootController = Get.find<RootController>();

  GridViewDevicesInRoom({Key? key}) : super(key: key);

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
                color: Palette.darkCerulean500,
              ),
            ),
            SizedBox(
              width: 180.w,
              height: 50.h,
              child: DropdownButtonFormField(
                items: _rootController.currentRaspberry.rooms
                    .map(
                      (e) => DropdownMenuItem(
                        value: e.id,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),
                onChanged: controller.onChangeDropdownRoom,
                value: controller.currentRoom?.id,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Palette.darkCerulean500,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        _rootController.currentRaspberry.rooms.isEmpty
            ? const Center(
                child: Text('Chưa có phòng nào'),
              )
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 16.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 60.w,
                  mainAxisSpacing: 20.h,
                ),
                itemCount: controller.currentRoom?.devices.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                    decoration: BoxDecoration(
                      color: Palette.lightGray,
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundColor: Palette.aliceBlue,
                              child: Icon(
                                UniconsLine.lightbulb,
                                color: Palette.blue300,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.controlDigitalDevice(index);
                              },
                              child: GetBuilder<HomeController>(
                                id: controller.currentRoom!.devices[index].id,
                                builder: (homeController) {
                                  return Container(
                                    width: 50.w,
                                    height: 30.h,
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.h),
                                      color: homeController.currentRoom!
                                              .devices[index].status
                                          ? Palette.blue400
                                          : Palette.cultured,
                                    ),
                                    child: Row(
                                      children: [
                                        homeController.currentRoom!
                                                .devices[index].status
                                            ? const Spacer()
                                            : const SizedBox(),
                                        Container(
                                          width: 25.w,
                                          height: 25.w,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(25.w),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          controller.currentRoom!.devices[index].name,
                          style: TextStyle(
                            color: Palette.blue500,
                            fontFamily: FontFamily.fontMulish,
                            fontWeight: FontWeight.w800,
                            fontSize: 18.sp,
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
      ],
    );
  }
}
