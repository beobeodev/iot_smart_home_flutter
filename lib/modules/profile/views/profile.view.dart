import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/core/theme/palette.dart';
import 'package:iot_smart_home/modules/profile/controllers/profile.controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: MediaQuery.of(context).padding.top + 20,
        ),
        child: Column(
          children: [
            TextButton(
              onPressed: controller.logout,
              style: TextButton.styleFrom(
                backgroundColor: Palette.blue200,
                fixedSize: const Size(double.infinity, 50),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Đăng xuất'),
            )
          ],
        ),
      ),
    );
  }
}
