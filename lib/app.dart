import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/core/router/route_manager.dart';
import 'package:iot_smart_home/generated/locales.g.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Smart Home',
          debugShowCheckedModeBanner: false,
          // builder: (context, widget) {
          //   ScreenUtil.setContext(context);
          //   return MediaQuery(
          //     data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          //     child: widget!,
          //   );
          // },
          getPages: RouteManager.pages,
          initialRoute: RouteManager.splash,
          translationsKeys: AppTranslation.translations,
          fallbackLocale: const Locale('vi', 'VN'),
          locale: Get.deviceLocale,
        );
      },
    );
  }
}
