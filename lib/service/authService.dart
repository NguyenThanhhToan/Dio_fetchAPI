import 'package:get/get.dart';
import '../model/userModel.dart';
import '../mockData/userMock.dart';

class AuthService extends GetxService {
  var isLoggedIn = false.obs;
  var user = Rx<User?>(null);

  String? pendingRoute;
  dynamic pendingArguments;

  Future<void> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    final checkUser= mockUser.firstWhereOrNull((user) => user.email == email && user.password == password);
    if (checkUser != null) {
      isLoggedIn.value = true;
      user.value = checkUser;
    }
  }

  void logout() {
    isLoggedIn.value = false;
    user.value = null;
    pendingRoute = null;
    pendingArguments = null;
  }
}
