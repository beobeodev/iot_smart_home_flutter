import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_smart_home/core/constants/asset_path.dart';
import 'package:iot_smart_home/core/theme/palette.dart';

class ContainerWeather extends StatelessWidget {
  const ContainerWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 145.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Palette.aliceBlue,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 6),
                    blurRadius: 12)
              ]),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '28°C',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    'Rainy',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  // SizedBox(
                  //   height: getProportionateScreenHeight(5),
                  // ),
                  Text(
                    '02/04/2022',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    'Da Nang',
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 12,
          left: 20,
          child: Image.asset(
            AssetPath.imageSunny,
            height: 160.h,
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}
