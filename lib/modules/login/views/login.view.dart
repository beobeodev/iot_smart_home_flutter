import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/core/constants/asset_path.dart';
import 'package:iot_smart_home/core/constants/font_family.dart';
import 'package:iot_smart_home/core/theme/palette.dart';
import 'package:iot_smart_home/generated/locales.g.dart';
import 'package:iot_smart_home/modules/login/controllers/login.controller.dart';
import 'package:iot_smart_home/modules/login/widgets/form_input.widget.dart';
import 'package:iot_smart_home/widgets/loading_dot.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  AssetPath.imageSmartHome,
                  height: 120.h,
                ),
                SizedBox(
                  height: ScreenUtil().screenHeight -
                      120.h -
                      MediaQuery.of(context).padding.top,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 220.h,
                        child: Container(
                          width: 364.w,
                          height: 430.h,
                          padding: EdgeInsets.only(top: 100.h, bottom: 20.h),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Palette.yellow200,
                                Palette.blue200,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const FormInput(),
                              Obx(
                                () => TextButton(
                                  onPressed: controller.login,
                                  style: TextButton.styleFrom(
                                    backgroundColor: Palette.blue300,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.h),
                                    ),
                                    fixedSize: Size(180.w, 50.h),
                                  ),
                                  child: controller.isProcessing.value
                                      ? const LoadingDot(
                                          size: 10,
                                        )
                                      : Text(
                                          LocaleKeys.button_login.tr,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: FontFamily.fontMulish,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 20.sp,
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          AssetPath.imageRoom,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
