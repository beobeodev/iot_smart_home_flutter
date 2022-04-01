import 'package:auto_route/auto_route.dart';
import 'package:iot_smart_home/modules/splash/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: "Page,Route",
  routes: <AutoRoute>[
    AutoRoute(path: "/", page: SplashScreen, initial: true),
    AutoRoute(path: "/home", page: SplashScreen),
  ]
)
class $AppRouter {}
