import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/modules/splash/controllers/splash.controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      backgroundColor: Colors.white,
    );
  }
}
