import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/core/constants/asset_path.dart';
import 'package:iot_smart_home/core/constants/font_family.dart';
import 'package:iot_smart_home/core/theme/palette.dart';
import 'package:iot_smart_home/core/utils/extensions/date_time.extension.dart';
import 'package:iot_smart_home/modules/home/controllers/home.controller.dart';

class ContainerWeather extends GetView<HomeController> {
  const ContainerWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 145.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Palette.aliceBlue,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 6),
                blurRadius: 12,
              )
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FutureBuilder(
                future: controller.getTempAndHuman(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text(
                      'Đang cập nhật...',
                      style: Theme.of(context).textTheme.subtitle1,
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${controller.currentDHT11.temperature} \u2103',
                          style: TextStyle(
                            fontFamily: FontFamily.fontMulish,
                            fontWeight: FontWeight.w800,
                            fontSize: 20.sp,
                            color: Palette.darkCerulean500,
                          ),
                        ),
                        Text(
                          '${controller.currentDHT11.humidity} %',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          DateTime.now().toFullDate,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          'Da Nang',
                          style: Theme.of(context).textTheme.subtitle1,
                        )
                      ],
                    );
                  }
                  return const SizedBox();
                },
              )
            ],
          ),
        ),
        Positioned(
          top: 12,
          left: 20,
          child: Image.asset(
            AssetPath.imageSunny,
            height: 160.h,
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}
