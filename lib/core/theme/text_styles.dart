import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_smart_home/core/constants/font_family.dart';
import 'package:iot_smart_home/core/theme/palette.dart';

abstract class TextStyles {
  static final TextStyle headLine1 = TextStyle(
      fontFamily: FontFamily.fontMulish,
      fontWeight: FontWeight.w700,
      fontSize: 20.sp,
      color: Palette.darkCerulean500);

  static final TextStyle bodyText1 = TextStyle(
    fontFamily: FontFamily.fontMulish,
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: Palette.darkCerulean500,
  );
}
