import 'package:get/get_navigation/src/routes/get_route.dart';
import '../home.dart';
import 'app_route.dart';
import '../login.dart';
class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => NameInputScreen(),
    ),
  ];
}