import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/core/constants/asset_path.dart';
import 'package:iot_smart_home/core/constants/font_family.dart';
import 'package:iot_smart_home/core/theme/palette.dart';
import 'package:iot_smart_home/modules/home/controllers/home.controller.dart';
import 'package:iot_smart_home/modules/home/widgets/gridview_devices_in_room.widget.dart';
import 'package:iot_smart_home/modules/home/widgets/container_weather.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(
          20.w,
          MediaQuery.of(context).padding.top + 10,
          20.w,
          80.h,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Palette.yellow200.withOpacity(0.4), Palette.ghostWhite],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.3],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chào buổi sáng, Quốc Đạt',
                      style: TextStyle(
                        fontFamily: FontFamily.fontMulish,
                        fontWeight: FontWeight.w800,
                        color: Palette.outerSpace500,
                        fontSize: 20.sp,
                      ),
                    ),
                    Text(
                      'Hãy luôn tiết kiệm điện!',
                      style: TextStyle(
                        fontFamily: FontFamily.fontMulish,
                        fontWeight: FontWeight.w400,
                        color: Palette.outerSpace300,
                        fontSize: 14.sp,
                      ),
                    )
                  ],
                ),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    AssetPath.imageAvatar,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            const ContainerWeather(),
            const SizedBox(
              height: 30,
            ),
            Align(
              child: TextButton(
                onPressed: controller.onTapButtonRecord,
                style: TextButton.styleFrom(
                  backgroundColor: Palette.blue500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  minimumSize: const Size(50, 50),
                ),
                child: Obx(
                  () => Icon(
                    controller.isRecording ? Icons.pause : Icons.mic,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [GridViewDevicesInRoom()],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
