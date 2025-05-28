import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppSettings extends GetxService {
  final _storage = GetStorage();

  static const String _language = 'language';
  static const String _darkMode = 'isDarkMode';

  RxBool isDarkMode = false.obs;
  RxString languageCode = 'en'.obs;

  Future<AppSettings> init() async {
    isDarkMode.value = _storage.read(_darkMode) ?? false;
    languageCode.value = _storage.read(_language) ?? 'en';
    return this;
  }

  Locale get locale => languageCode.value == 'vi'
      ? const Locale('vi', 'VN')
      : const Locale('en', 'US');

  ThemeMode get themeMode =>
      isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _storage.write(_darkMode, isDarkMode.value);
  }

  void setLanguage(String value) {
    languageCode.value = value;
    _storage.write(_language, value);
    Get.updateLocale(locale);
  }
}
