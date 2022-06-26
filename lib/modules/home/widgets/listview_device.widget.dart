import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_smart_home/core/constants/font_family.dart';
import 'package:iot_smart_home/core/theme/palette.dart';
import 'package:unicons/unicons.dart';

class ListViewDevice extends StatelessWidget {
  const ListViewDevice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Thiết bị',
          style: TextStyle(
            fontFamily: FontFamily.fontMulish,
            fontWeight: FontWeight.w800,
            fontSize: 20.sp,
            color: Palette.darkCerulean500,
          ),
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
                padding: EdgeInsets.only(left: index == 0 ? 0.0 : 15.w),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30.w,
                      child: const Icon(UniconsLine.lightbulb_alt),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Đèn',
                      style: TextStyle(
                        color: Palette.outerSpace400,
                        fontFamily: FontFamily.fontMulish,
                        fontSize: 14.sp,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
