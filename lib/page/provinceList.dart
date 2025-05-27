import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/provinceController.dart';
import '../widget/provinceItem.dart';

class ProvinceList extends StatelessWidget {
  const ProvinceList({super.key});

  @override
  Widget build(BuildContext context) {
    final provinceController = Get.put(ProvinceController());
    provinceController.fetchProvinces();

    return Scaffold(
      appBar: AppBar(title: const Text("List province")),
      body: Obx(() {
        if (provinceController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (provinceController.provinces.isEmpty) {
          return const Center(child: Text("Not found data"));
        }

        return ListView.builder(
          itemCount: provinceController.provinces.length,
          itemBuilder: (context, index) {
            final province = provinceController.provinces[index];
            return ProvinceItem(province: province);
          },
        );
      }),
    );
  }
}