import 'package:get/get.dart';

class UserService extends GetxService {
  var userName = "".obs;
  var age = 0.obs;

  void login(String name) {
    userName.value = name;
  }

  void update(String name, int newAge) {
    userName.value = name;
    age.value = newAge;
  }
}
