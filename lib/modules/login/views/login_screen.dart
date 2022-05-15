import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/core/constants/asset_path.dart';
import 'package:iot_smart_home/core/constants/font_family.dart';
import 'package:iot_smart_home/core/router/route_manager.dart';
import 'package:iot_smart_home/core/theme/palette.dart';
import 'package:iot_smart_home/modules/login/controllers/login_controller.dart';
import 'package:unicons/unicons.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: SingleChildScrollView(
          child: Column(children: [
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
                      padding: EdgeInsets.only(top: 100.h, bottom: 60.h),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [
                                Palette.yellow200,
                                Palette.blue200,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 330.w,
                            height: 160.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 25.w, vertical: 15.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFormField(
                                  controller:
                                      loginController.emailTextController,
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      icon: CircleAvatar(
                                        child: Icon(
                                          UniconsLine.user,
                                          size: 22.sp,
                                          color: Palette.yellow500,
                                        ),
                                        backgroundColor: Palette.lightGray,
                                        radius: 20.w,
                                      ),
                                      hintText: "Tài khoản",
                                      hintStyle: TextStyle(
                                          fontFamily: FontFamily.fontMulish,
                                          fontSize: 17.sp,
                                          color: Palette.lightGray),
                                      border: InputBorder.none),
                                  style: const TextStyle(
                                    color: Palette.darkCerulean500,
                                    fontFamily: FontFamily.fontMulish,
                                  ),
                                  onChanged: (value) {
                                    log(value);
                                  },
                                ),
                                const Divider(
                                  color: Palette.lightGray,
                                  thickness: 1.2,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      icon: CircleAvatar(
                                        child: Icon(
                                          UniconsLine.lock,
                                          size: 22.sp,
                                          color: Palette.yellow500,
                                        ),
                                        backgroundColor: Palette.lightGray,
                                        radius: 20.w,
                                      ),
                                      hintText: "Mật khẩu",
                                      hintStyle: TextStyle(
                                          fontFamily: FontFamily.fontMulish,
                                          fontSize: 17.sp,
                                          color: Palette.lightGray),
                                      border: InputBorder.none),
                                  style: const TextStyle(
                                    color: Palette.darkCerulean500,
                                    fontFamily: FontFamily.fontMulish,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () => Get.offAllNamed(RouteManager.root),
                            style: TextButton.styleFrom(
                                backgroundColor: Palette.blue300,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.h)),
                                fixedSize: Size(180.w, 50.h)),
                            child: Text(
                              "Đăng nhập",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: FontFamily.fontMulish,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20.sp),
                            ),
                          )
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
          ]),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
