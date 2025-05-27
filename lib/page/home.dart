import 'package:basic_app/controller/authController.dart';
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
      appBar: AppBar(title: const Text('Thông tin người dùng')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() => Text(
              'Hi! : ${authService.user.value?.name ?? "Guest"}',
              style: const TextStyle(fontSize: 20),
            )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: authController.logout,
              child: const Text('Logout'),
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