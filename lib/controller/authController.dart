import 'package:get/get.dart';
import '../router/app_route.dart';
import '../service/authService.dart';
class AuthController extends GetxController{
  final authService = Get.find<AuthService>();

  final userName = ''.obs;
  final password = ''.obs;

  Future<void> handleLogin() async {
    await authService.login(userName.value, password.value);

    if (authService.isLoggedIn.value) {

      final redirectRoute = authService.pendingRoute;
      final redirectArgs = authService.pendingArguments;

      authService.pendingRoute = null;
      authService.pendingArguments = null;

      if (redirectRoute != null) {
        Get.offNamed(redirectRoute, arguments: redirectArgs);
      } else {
        Get.offAllNamed(AppRoutes.homeScreen);
      }
    } else {
      Get.snackbar('Error', 'Email or password is incorrect');
    }
  }

  void logout() {
    authService.logout();
    Get.offAllNamed(AppRoutes.homeScreen);
  }
}