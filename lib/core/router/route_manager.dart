import 'package:flutter/material.dart';
import 'package:iot_smart_home/modules/home/home_screen.dart';
import 'package:iot_smart_home/modules/splash/splash_screen.dart';

class RouteManager {
  static const String splashScreen = "/";
  static const String homeScreen = "/home";

  static Map<String, WidgetBuilder> listRoute = {
    splashScreen: (_) => const SplashScreen(),
    homeScreen: (_) => const HomeScreen()
  };
}