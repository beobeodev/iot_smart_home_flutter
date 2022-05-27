import 'package:get/get.dart';
import 'package:iot_smart_home/core/router/route_manager.dart';
import 'package:iot_smart_home/domain/usecases/authentication/check_logged_in.usecase.dart';

class SplashController extends GetxController {
  final CheckLoggedInUseCase checkLoggedInUseCase;

  SplashController({required this.checkLoggedInUseCase});

  Future<void> getData() async {
    final bool isLogged = await checkLoggedInUseCase.execute();
    if (!isLogged) {
      Get.offAllNamed(RouteManager.login);
    } else {
      Get.offAllNamed(RouteManager.home);
    }
  }
}
