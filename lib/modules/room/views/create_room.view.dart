import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/core/constants/font_family.dart';
import 'package:iot_smart_home/core/theme/palette.dart';
import 'package:iot_smart_home/core/theme/text_styles.dart';
import 'package:iot_smart_home/domain/entities/device.entity.dart';
import 'package:iot_smart_home/modules/room/controllers/create_room.controller.dart';
import 'package:iot_smart_home/widgets/popup_update_device.widget.dart';
import 'package:iot_smart_home/widgets/rounded_icon_button.widget.dart';
import 'package:iot_smart_home/widgets/rounded_text_form_field.widget.dart';

class CreateRoomScreen extends GetView<CreateRoomController> {
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 10,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleIconButton(
                  onPressed: () {
                    Get.back();
                  },
                  iconData: Icons.chevron_left,
                ),
                CircleIconButton(
                  onPressed: controller.addRoom,
                  iconData: Icons.check,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text('Phòng', style: TextStyles.headLine1),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              child: Form(
                key: controller.keyForm,
                child: RoundedTextFormField(
                  hintText: 'Tên phòng',
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Nhập tên phòng';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    controller.currentRoom.name = value;
                  },
                  radius: 12,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Thiết bị', style: TextStyles.headLine1),
                CircleIconButton(
                  onPressed: controller.onTapButtonAddDevice,
                  iconData: Icons.add,
                  iconSize: 15,
                  iconColor: Colors.white,
                  backgroundColor: Palette.blue400,
                  buttonSize: 25,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: controller.currentRoom.devices.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final DeviceEntity currentDevice =
                      controller.currentRoom.devices[index];
                  return TextButton(
                    onPressed: () {
                      Get.dialog(
                        PopupUpdateDevice(
                          addDeviceToList: controller.addDeviceToList,
                          device: currentDevice,
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      backgroundColor: Colors.white,
                      fixedSize: Size(0.h, 70.h),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Palette.blue400,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            currentDevice.name,
                            style: TextStyle(
                              color: Palette.purple,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              fontFamily: FontFamily.fontMulish,
                            ),
                          ),
                          Text(
                            'Cổng: ${currentDevice.gate}',
                            style: TextStyle(
                              color: Palette.blue400,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              fontFamily: FontFamily.fontMulish,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      backgroundColor: Palette.cosmicWhite,
    );
  }
}
