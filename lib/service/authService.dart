import 'package:get/get.dart';
import '../model/userModel.dart';
import '../mockData/userMock.dart';

class AuthService extends GetxService {
  var isLoggedIn = false.obs;
  var user = Rx<User?>(null);

  Future<void> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    final check= mockUser.firstWhereOrNull((user) => user.email == email && user.password == password);

    if (check != null) {
      isLoggedIn.value = true;
      user.value = check;
    }
  }

  void logout() {
    isLoggedIn.value = false;
    user.value = null;
  }
}
