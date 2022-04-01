import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ControlContainer extends StatelessWidget {
  final bool turnOn;
  final String iconDevicePath;
  final String deviceName;

  const ControlContainer({Key? key, this.turnOn = false, required this.iconDevicePath, required this.deviceName}) : super(key: key);

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
            ? Colors.red
            : const Color(0xffededed),
        borderRadius: BorderRadius.circular(15)
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
                      ? const Color.fromRGBO(45, 45, 45, 1)
                      : const Color(0xffdadada),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: SvgPicture.asset(
                  iconDevicePath,
                  color: turnOn ? Colors.amber : const Color(0xFF808080),
                ),
              ),
              const Icon(
                Icons.star_rounded,
                color: Color(0xFF808080),
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
                onTap: () {

                },
                child: Container(
                  width: 48.w,
                  height: 25.6.h,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: turnOn ? Colors.black : const Color(0xffd6d6d6),
                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      width: turnOn ? 2 : 0,
                    ),
                  ),
                  child: Row(
                    children: [
                      turnOn ? const Spacer() : const SizedBox(),
                      Container(
                        width: 20.w,
                        height: 20.w,
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
