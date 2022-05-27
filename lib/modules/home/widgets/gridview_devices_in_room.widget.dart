import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_smart_home/core/constants/font_family.dart';
import 'package:iot_smart_home/core/theme/palette.dart';
import 'package:unicons/unicons.dart';

class GridViewDevicesInRoom extends StatelessWidget {
  const GridViewDevicesInRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                          Container(
                            width: 50.w,
                            height: 30.h,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.h),
                              color: Palette.cultured,
                            ),
                            child: Row(children: [
                              Container(
                                width: 25.w,
                                height: 25.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25.w)),
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
      ],
    );
  }
}
