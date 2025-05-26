import 'package:basic_app/router/app_page.dart';
import 'package:basic_app/router/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/user.dart';
void main() {
  Get.put(UserService());
  runApp(const MyApp());
}
// // profile_binding.dart
// class ProfileBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<ProfileController>(() => ProfileController());
//     Get.lazyPut<UserController>(() => UserController());
//     Get.lazyPut<ImageUploadService>(() => ImageUploadService());
//   }
// } tim injection cho từng trang.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Name Input App',
      initialRoute: AppRoutes.login,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
    );
  }
}

