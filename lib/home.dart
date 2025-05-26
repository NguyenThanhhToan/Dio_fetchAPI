import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/user.dart';

class HomeScreen extends GetWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Get.find<UserService>();
    final TextEditingController nameController = TextEditingController(text: userService.userName.value,);
    final TextEditingController ageController = TextEditingController(text: userService.age.toString());
    return Scaffold(
      appBar: AppBar(title: const Text('Thông tin người dùng')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() => Text(
              'Xin chào: ${userService.userName.value}',
              style: const TextStyle(fontSize: 20),
            )),
            Obx(() => Text(
              'Tuổi: ${userService.age.value}',
              style: const TextStyle(fontSize: 20),
            )),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nhập tên người dùng'),
              ),
            ),
            const SizedBox(height: 20),
            Padding(padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: ageController,
                decoration: const InputDecoration(
                    labelText: 'tuổi của người dùng'),
              )
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String newName = nameController.text.trim();
                int? newAge = int.tryParse(ageController.text.trim());

                if (newName.isNotEmpty && newAge != null) {
                  userService.update(newName, newAge);
                }
              },
              child: const Text('Cập nhật'),
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