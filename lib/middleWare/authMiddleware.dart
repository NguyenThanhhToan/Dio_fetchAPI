import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../service/authService.dart';

class AuthMiddleware extends GetMiddleware{
  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<AuthService>();

    if(!authService.isLoggedIn.value){
      return const RouteSettings(name: '/login',);
    }
    return null;
  }
}