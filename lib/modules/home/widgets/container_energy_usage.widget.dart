import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_smart_home/core/constants/font_family.dart';
import 'package:iot_smart_home/core/theme/palette.dart';
import 'package:unicons/unicons.dart';

class ContainerEnergyUsage extends StatelessWidget {
  const ContainerEnergyUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            blurRadius: 12,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lượng điện sử dụng',
                style: TextStyle(
                  fontFamily: FontFamily.fontMulish,
                  fontWeight: FontWeight.w800,
                  color: Palette.outerSpace500,
                  fontSize: 16.sp,
                ),
              ),
              Row(
                children: [
                  const Icon(UniconsLine.stopwatch),
                  Text(
                    '06/05/2022',
                    style: TextStyle(
                      fontFamily: FontFamily.fontMulish,
                      fontSize: 14.sp,
                      color: Palette.outerSpace500,
                    ),
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
                          color: Palette.outerSpace300,
                        ),
                      ),
                      Text(
                        '30 kWh',
                        style: TextStyle(
                          fontFamily: FontFamily.fontMulish,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                          color: Palette.darkCerulean500,
                        ),
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
                          color: Palette.outerSpace300,
                        ),
                      ),
                      Text(
                        '323 kWh',
                        style: TextStyle(
                          fontFamily: FontFamily.fontMulish,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                          color: Palette.darkCerulean500,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
