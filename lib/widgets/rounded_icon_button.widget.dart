import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_smart_home/core/theme/palette.dart';

class CircleIconButton extends StatelessWidget {
  final void Function() onPressed;

  final IconData iconData;

  final Color backgroundColor;
  final Color iconColor;

  final double iconSize;
  final double buttonSize;

  const CircleIconButton({
    Key? key,
    required this.onPressed,
    required this.iconData,
    this.backgroundColor = Colors.white,
    this.iconColor = Palette.blue500,
    this.iconSize = 20,
    this.buttonSize = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        backgroundColor: backgroundColor,
        shape: const CircleBorder(),
        elevation: 5.0,
        fixedSize: Size(buttonSize.h, buttonSize.h),
        minimumSize: Size(buttonSize.h, buttonSize.h),
      ),
      child: Icon(
        iconData,
        size: iconSize.sp,
        color: iconColor,
      ),
    );
  }
}
