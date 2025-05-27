import 'package:get/get.dart';
import '../router/app_route.dart';
import '../service/authService.dart';
class AuthController extends GetxController{
  final authService = Get.find<AuthService>();

  final userName = ''.obs;
  final password = ''.obs;

  Future<void> handleLogin() async {
    print("userName: ${userName.value}, password: ${password.value}");

    await authService.login(userName.value, password.value);

    if (authService.isLoggedIn.value) {
      Get.offAllNamed(AppRoutes.homeScreen);
    } else {
      Get.snackbar('Erro', 'Email or password is incorrect');
    }
  }

  void logout() {
    authService.logout();
    Get.offAllNamed(AppRoutes.login);
  }
}