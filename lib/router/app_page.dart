import 'package:get/get.dart';
import '../controller/authController.dart';
import '../page/home.dart';
import 'app_route.dart';
import '../page/login.dart';
class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => loginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
    ),
  ];
}