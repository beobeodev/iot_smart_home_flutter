import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_smart_home/core/constants/font_family.dart';
import 'package:iot_smart_home/core/theme/palette.dart';
import 'package:iot_smart_home/modules/home/widgets/gridview_devices_in_room.widget.dart';
import 'package:iot_smart_home/modules/home/widgets/listview_device.widget.dart';
import 'package:iot_smart_home/modules/home/widgets/container_weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(
            20.w, MediaQuery.of(context).padding.top + 10, 20.w, 80.h),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Palette.yellow200.withOpacity(0.4),
                  Palette.ghostWhite
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.3])),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Chào buổi sáng, Quốc Đạt',
                      style: TextStyle(
                          fontFamily: FontFamily.fontMulish,
                          fontWeight: FontWeight.w800,
                          color: Palette.outerSpace500,
                          fontSize: 20.sp)),
                  Text('Hãy luôn tiết kiệm điện!',
                      style: TextStyle(
                          fontFamily: FontFamily.fontMulish,
                          fontWeight: FontWeight.w400,
                          color: Palette.outerSpace300,
                          fontSize: 14.sp))
                ],
              ),
              Container(width: 50.w, height: 50.w, color: Colors.red)
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          const ContainerWeather(),
          SizedBox(
            height: 36.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ListViewDevice(),
                    GridViewDevicesInRoom(),
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}
