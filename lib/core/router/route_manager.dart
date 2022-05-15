import 'package:flutter/material.dart';
import 'package:iot_smart_home/modules/home/home_screen.dart';
import 'package:iot_smart_home/modules/home/views/light_control_screen.dart';
import 'package:iot_smart_home/modules/login/views/login_screen.dart';
import 'package:iot_smart_home/modules/root/views/root_screen.dart';
import 'package:iot_smart_home/modules/splash/splash_screen.dart';

class RouteManager {
  static const String splash = "/";
  static const String login = "/login";
  static const String root = "/root";
  static const String home = "/home";
  static const String controlLight = "/controlLightScreen";

  static Map<String, WidgetBuilder> listRoute = {
    splash: (_) => const SplashScreen(),
    login: (_) => LoginScreen(),
    root: (_) => const RootScreen(),
    home: (_) => const HomeScreen(),
    controlLight: (_) => const LightControlScreen(),
  };
}
