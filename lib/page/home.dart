import 'package:basic_app/controller/authController.dart';
import 'package:basic_app/router/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../service/authService.dart';

class HomeScreen extends GetWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthService>();
    final authController = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(title: Text('${'user_info'.tr}')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() => Text(
             '${'hello'.tr} : ${authService.user.value?.name ?? "Guest"}',
              style: const TextStyle(fontSize: 20),
            )),
            const SizedBox(height: 20),

            Obx(() => ElevatedButton(
              onPressed: authService.isLoggedIn.value
                  ? authController.logout
                  : () => Get.toNamed(AppRoutes.login),
              child: Text(authService.isLoggedIn.value ? 'Logout' : 'Login'),
            )),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.provinceListScreen),
              child: Text('${'provinceList'.tr}'),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.settingScreen),
              child: Text('${'setting'.tr}'),
            ),
            const SizedBox(height: 20),
            Image.network(
              'https://picsum.photos/200',
              height: 200,
              width: 300,
            ),
          ],
        )
      ),
    );
  }
}