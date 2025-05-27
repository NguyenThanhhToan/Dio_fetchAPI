import 'package:basic_app/router/app_page.dart';
import 'package:basic_app/router/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/authService.dart';
void main () async {
  await Get.putAsync(() async => AuthService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Name Input App',
      initialRoute: AppRoutes.homeScreen,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
    );
  }
}

