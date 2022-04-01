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
            right: 10
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '28°C',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    'Cloudy',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  // SizedBox(
                  //   height: getProportionateScreenHeight(5),
                  // ),
                  Text(
                    '27 Mar 2022',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    'Jagakarsa,Jakarta',
                    style: Theme.of(context).textTheme.headline6,
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
