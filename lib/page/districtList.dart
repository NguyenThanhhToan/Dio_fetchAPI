import 'package:basic_app/widget/districtItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/districtController.dart';

class DistrictScreen extends StatelessWidget{

  const DistrictScreen({super.key, required this.provinceID});
  final int provinceID;

  @override
  Widget build(BuildContext context) {

    final districtController = Get.find<DistrictController>();
    districtController.fetchDistricts(provinceID);
    return Scaffold(
      appBar: AppBar(title: const Text("List district")),
      body: Obx(() {
        if (districtController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (districtController.districts.isEmpty) {
          return const Center(child: Text("Not found data"));
        }

        return ListView.builder(
          itemCount: districtController.districts.length,
          itemBuilder: (context, index) {
            final province = districtController.districts[index];
            return DistrictItem(district: province);
          },
        );
      }),
    );
  }
}