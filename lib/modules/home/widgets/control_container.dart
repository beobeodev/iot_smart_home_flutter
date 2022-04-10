import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iot_smart_home/core/constants/palette.dart';

class ControlContainer extends StatelessWidget {
  final bool turnOn;
  final String iconDevicePath;
  final String deviceName;
  final void Function() onTapTurnOn;

  const ControlContainer({Key? key, this.turnOn = false, required this.iconDevicePath, required this.deviceName, required this.onTapTurnOn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (ScreenUtil().screenWidth - 40)/2 - 20,
      height: (ScreenUtil().screenWidth - 40)/2 - 20,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10
      ),
      decoration: BoxDecoration(
        color: turnOn
            ? Palette.orange500
            : Palette.gray100,
        borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset:  const Offset(0, 1),
              blurRadius: 4,
              color: Palette.gray500.withOpacity(0.3)
            )
          ]
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: turnOn
                      ? Colors.white
                      : Palette.gray300,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: SvgPicture.asset(
                  iconDevicePath,
                  color: turnOn ? Colors.amber : Palette.gray100,
                ),
              ),
              const Icon(
                Icons.star_rounded,
                color: Colors.white,
              ),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              deviceName,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                color: turnOn ? Colors.white : Colors.black,
                fontSize: 15
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                turnOn ? 'On' : 'Off',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: turnOn ? Colors.white : Colors.black,
                  fontSize: 15
                ),
              ),
              GestureDetector(
                onTap: onTapTurnOn,
                child: Container(
                  width: 48.w,
                  height: 26.h,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: turnOn ? Palette.blue200 : Palette.gray300,
                    border: Border.all(
                      color: Colors.white,
                      width: turnOn ? 2 : 0,
                    ),
                  ),
                  child: Row(
                    children: [
                      turnOn ? const Spacer() : const SizedBox(),
                      Container(
                        width: 18.w,
                        height: 18.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
