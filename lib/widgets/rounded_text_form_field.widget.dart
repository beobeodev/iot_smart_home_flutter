import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_smart_home/core/theme/palette.dart';
import 'package:iot_smart_home/core/theme/text_styles.dart';

class RoundedTextFormField extends StatelessWidget {
  final TextEditingController? textController;

  final TextInputType? textInputType;

  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  final String? hintText;
  final String? errorText;
  final String? initValue;

  final double radius;

  const RoundedTextFormField({
    Key? key,
    this.textController,
    this.textInputType,
    this.onChanged,
    this.validator,
    this.hintText,
    this.errorText,
    this.initValue,
    this.radius = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      onChanged: onChanged,
      validator: validator,
      keyboardType: textInputType,
      initialValue: initValue,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyles.bodyText1.copyWith(color: Palette.lightGray),
        errorText: errorText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(
            color: Palette.blue400,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(
            color: Palette.blue400,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(
            color: Palette.blue400,
          ),
        ),
      ),
      style: TextStyles.bodyText1,
    );
  }
}
