import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/appSettingService.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Get.find<AppSettings>();

    return Scaffold(
      appBar: AppBar(title: const Text("Setting")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Switch(
              value: settings.isDarkMode.value,
              onChanged: (_) => settings.toggleTheme(),
             )
            ),
            const SizedBox(height: 20),
            Obx(() => DropdownButton<String>(
              value: settings.languageCode.value,
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'vi', child: Text('Tiếng Việt')),
              ],
              onChanged: (val) {
                if (val != null) {
                  settings.setLanguage(val);
                  Get.updateLocale(settings.locale);
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
