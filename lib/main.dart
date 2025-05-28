import 'package:basic_app/router/app_page.dart';
import 'package:basic_app/router/app_route.dart';
import 'package:basic_app/service/appSettingService.dart';
import 'package:basic_app/theme/appTheme.dart';
import 'package:basic_app/theme/language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../service/authService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  await Get.putAsync(() async => AuthService());
  await Get.putAsync(() async => AppSettings().init());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Get.find<AppSettings>();

    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Name Input App',
      translations: AppTranslations(),
      locale: settings.locale,
      initialRoute: AppRoutes.homeScreen,
      getPages: AppPages.routes,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: settings.themeMode,
    ));
  }
}
