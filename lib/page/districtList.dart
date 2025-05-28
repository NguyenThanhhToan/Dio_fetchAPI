import 'package:basic_app/widget/districtItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/districtController.dart';

class DistrictScreen extends GetWidget<DistrictController> {

  const DistrictScreen({super.key,});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("List district")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.districts.isEmpty) {
          return const Center(child: Text("Not found data"));
        }

        return ListView.builder(
          itemCount: controller.districts.length,
          itemBuilder: (context, index) {
            final province = controller.districts[index];
            return DistrictItem(district: province);
          },
        );
      }),
    );
  }
}