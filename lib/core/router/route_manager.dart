import 'package:get/get.dart';
import 'package:iot_smart_home/modules/home/home_screen.dart';
import 'package:iot_smart_home/modules/home/views/light_control_screen.dart';
import 'package:iot_smart_home/modules/login/bindings/login.binding.dart';
import 'package:iot_smart_home/modules/login/views/login.view.dart';
import 'package:iot_smart_home/modules/root/bindings/root.binding.dart';
import 'package:iot_smart_home/modules/root/views/root.view.dart';
import 'package:iot_smart_home/modules/splash/bindings/splash.binding.dart';
import 'package:iot_smart_home/modules/splash/views/splash.view.dart';

class RouteManager {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String root = '/root';
  static const String home = '/home';
  static const String controlLight = '/controlLightScreen';

  static List<GetPage> pages = [
    GetPage(
        name: splash,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: login, page: () => const LoginScreen(), binding: LoginBinding()),
    GetPage(name: root, page: () => const RootScreen(), binding: RootBinding()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: controlLight, page: () => const ControlLighScreen()),
  ];
}
