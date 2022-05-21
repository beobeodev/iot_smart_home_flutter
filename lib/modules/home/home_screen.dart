import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_smart_home/core/constants/font_family.dart';
import 'package:iot_smart_home/core/theme/palette.dart';
import 'package:unicons/unicons.dart';

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
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Palette.yellow200, Palette.ghostWhite],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.3])),
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
          Container(
            width: double.infinity,
            height: 145.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 6),
                      blurRadius: 12)
                ]),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lượng điện sử dụng',
                    style: TextStyle(
                        fontFamily: FontFamily.fontMulish,
                        fontWeight: FontWeight.w800,
                        color: Palette.outerSpace500,
                        fontSize: 16.sp),
                  ),
                  Row(
                    children: [
                      const Icon(UniconsLine.stopwatch),
                      Text(
                        '06/05/2022',
                        style: TextStyle(
                            fontFamily: FontFamily.fontMulish,
                            fontSize: 14.sp,
                            color: Palette.outerSpace500),
                      ),
                      const Icon(UniconsLine.angle_down)
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Palette.lightGray,
                thickness: 1.2,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(UniconsLine.bolt_alt),
                      SizedBox(
                        width: 6.w,
                      ),
                      Column(
                        children: [
                          Text(
                            'Hôm nay',
                            style: TextStyle(
                                fontFamily: FontFamily.fontMulish,
                                fontSize: 14.sp,
                                color: Palette.outerSpace300),
                          ),
                          Text(
                            '30 kWh',
                            style: TextStyle(
                                fontFamily: FontFamily.fontMulish,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                color: Palette.darkCerulean500),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(UniconsLine.bolt_alt),
                      SizedBox(
                        width: 6.w,
                      ),
                      Column(
                        children: [
                          Text(
                            'Tháng này',
                            style: TextStyle(
                                fontFamily: FontFamily.fontMulish,
                                fontSize: 14.sp,
                                color: Palette.outerSpace300),
                          ),
                          Text(
                            '323 kWh',
                            style: TextStyle(
                                fontFamily: FontFamily.fontMulish,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                color: Palette.darkCerulean500),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ]),
          ),
          SizedBox(
            height: 36.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thiết bị',
                      style: TextStyle(
                          fontFamily: FontFamily.fontMulish,
                          fontWeight: FontWeight.w800,
                          fontSize: 20.sp,
                          color: Palette.darkCerulean500),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 120.h,
                      child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(top: 16.h),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: index == 0 ? 0.0 : 15.w),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 30.w,
                                    child:
                                        const Icon(UniconsLine.lightbulb_alt),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    'Đèn',
                                    style: TextStyle(
                                        color: Palette.outerSpace400,
                                        fontFamily: FontFamily.fontMulish,
                                        fontSize: 14.sp),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    Text(
                      'Phòng khách',
                      style: TextStyle(
                          fontFamily: FontFamily.fontMulish,
                          fontWeight: FontWeight.w800,
                          fontSize: 20.sp,
                          color: Palette.darkCerulean500),
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 16.h),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 60.w,
                            mainAxisSpacing: 20.h),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.h, horizontal: 15.w),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CircleAvatar(
                                        radius: 20,
                                        child: Icon(
                                          UniconsLine.lightbulb,
                                          color: Palette.blue300,
                                        ),
                                        backgroundColor: Palette.aliceBlue,
                                      ),
                                      Container(
                                        width: 50.w,
                                        height: 30.h,
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.h),
                                          color: Palette.cultured,
                                        ),
                                        child: Row(children: [
                                          Container(
                                            width: 25.w,
                                            height: 25.w,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        25.w)),
                                          )
                                        ]),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    'Đèn',
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
                        })
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}
