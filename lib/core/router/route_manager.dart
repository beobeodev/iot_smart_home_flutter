import 'package:flutter/material.dart';
import 'package:iot_smart_home/modules/home/home_screen.dart';
import 'package:iot_smart_home/modules/home/views/light_control_screen.dart';
import 'package:iot_smart_home/modules/root/views/root_screen.dart';
import 'package:iot_smart_home/modules/splash/splash_screen.dart';

class RouteManager {
  static const String splashScreen = "/";
  static const String root = "/root";
  static const String homeScreen = "/home";
  static const String controlLightScreen = "/controlLightScreen";

  static Map<String, WidgetBuilder> listRoute = {
    splashScreen: (_) => const SplashScreen(),
    root: (_) => const RootScreen(),
    homeScreen: (_) => const HomeScreen(),
    controlLightScreen: (_) => const LightControlScreen(),
  };
}
