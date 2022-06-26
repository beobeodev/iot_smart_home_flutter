import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_smart_home/core/constants/font_family.dart';
import 'package:iot_smart_home/core/theme/palette.dart';

class IconTextFormField extends StatelessWidget {
  final TextEditingController textController;
  final Color fillColor;
  final String? hintText;
  final double hintTextSize;
  final double textSize;
  final IconData? icon;
  final double iconSize;
  final Color iconColor;
  final Color backgroundIconColor;
  final bool isObsecure;
  final InputBorder border;

  final void Function(String)? onChanged;

  const IconTextFormField({
    Key? key,
    required this.textController,
    this.fillColor = Colors.white,
    this.hintText,
    this.hintTextSize = 17,
    this.textSize = 17,
    this.onChanged,
    this.icon,
    this.iconSize = 22,
    this.iconColor = Palette.yellow500,
    this.backgroundIconColor = Palette.lightGray,
    this.isObsecure = false,
    this.border = InputBorder.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        icon: CircleAvatar(
          backgroundColor: backgroundIconColor,
          radius: 20.w,
          child: Icon(
            icon,
            size: iconSize.sp,
            color: iconColor,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: FontFamily.fontMulish,
          fontSize: hintTextSize.sp,
          color: Palette.lightGray,
        ),
        border: border,
      ),
      style: TextStyle(
        color: Palette.darkCerulean500,
        fontSize: textSize.sp,
        fontFamily: FontFamily.fontMulish,
      ),
      onChanged: onChanged,
      obscureText: isObsecure,
    );
  }
}
