import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_smart_home/core/constants/asset_path.dart';

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 140.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                offset:  const Offset(0, 1),
                blurRadius: 4,
                color: const Color(0xFF333333).withOpacity(0.4)
              )
            ]
          ),
          padding: const EdgeInsets.only(
            top: 10,
            right: 10,
            bottom: 10
          ),
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
        Image.asset(
          AssetPath.imageWeatherRain,
          height: 160.h,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
