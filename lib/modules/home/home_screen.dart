import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_smart_home/core/constants/asset_path.dart';
import 'package:iot_smart_home/modules/home/widgets/control_container.dart';
import 'package:iot_smart_home/modules/home/widgets/weather_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE5E5E5),
          automaticallyImplyLeading: false,
          toolbarHeight: 70.h,
          //centerTitle: true,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hi, Lex',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xffdadada),
                    borderRadius:
                    BorderRadius.all(Radius.elliptical(45, 45)),
                  ),
                  child: IconButton(
                    splashRadius: 25,
                    icon: const Icon(
                      Icons.verified_user,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                    },
                  ),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.keyboard_voice
                ),
                SizedBox(
                  height: 20,
                ),
                TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    indicatorColor: const Color(0xFF464646),
                    tabs: [
                      Container(
                        width: ScreenUtil().screenWidth/3,
                        child: Text(
                          'Living Room',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      Container(
                        width: ScreenUtil().screenWidth/3,
                        child: Text(
                          'Dining',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Kitchen',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ]),
              ],
            ),
            preferredSize: const Size.fromHeight(
              100
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20,
                  left: 20, right: 20),
              child: Column(
                children: [
                  const WeatherContainer(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      ControlContainer(
                        // turnOn: true,
                        iconDevicePath: AssetPath.iconLight,
                        deviceName: "Light",
                      ),
                      ControlContainer(
                        // turnOn: true,
                        iconDevicePath: AssetPath.iconLight,
                        deviceName: "Light",
                      ),
                    ],
                  )
                ],
              ),
            ),
            Center(
              child: Text(
                'To be Built Soon',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            const Center(
              child: Text('under construction'),
            ),
          ],
        )
      ),
    );
  }
}
