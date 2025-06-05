import 'package:basic_app/controller/formDataDioController.dart';
import 'package:basic_app/controller/provinceController.dart';
import 'package:basic_app/page/formDataDio.dart';
import 'package:basic_app/service/formDataDioService.dart';
import 'package:get/get.dart';
import '../controller/districtController.dart';
import '../middleWare/authMiddleware.dart';
import '../page/districtList.dart';
import '../page/provinceList.dart';
import '../page/setting.dart';
import '../service/districtService.dart';
import '../service/provinceService.dart';
import 'app_route.dart';
import '../controller/authController.dart';
import '../page/home.dart';
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
      page: () => LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
    ),
    GetPage(
      name: AppRoutes.provinceListScreen,
      page: () => ProvinceList(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ProvinceService>(() => ProvinceService());
        Get.lazyPut<ProvinceController>(() => ProvinceController(Get.find()));
      }),
    ),
    GetPage(
      name: AppRoutes.districtScreen,
      page: () => DistrictScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<DistrictService>(() => DistrictService());
        Get.lazyPut<DistrictController>(() => DistrictController(Get.find()));
      }),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: AppRoutes.settingScreen,
      page: () => const SettingScreen(),
    ),
    GetPage(
      name: AppRoutes.formDataDioScreen,
      page: () => UploadBookPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<UploadData>(() => UploadData());
        Get.lazyPut<FormDataDioController>(() => FormDataDioController());
      }),
    ),

  ];
}