import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/province.dart';
import '../router/app_route.dart';
import '../service/authService.dart';

class ProvinceItem extends StatelessWidget{

  const ProvinceItem({super.key, required this.province});

  final Province province;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final authService = Get.find<AuthService>();
        authService.pendingRoute = AppRoutes.districtScreen;
        authService.pendingArguments = province.provinceID;
        Get.toNamed(AppRoutes.districtScreen, arguments: province.provinceID);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.location_city, size: 32.0, color: Colors.blue),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    province.provinceName,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "ID: ${province.provinceID}",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
