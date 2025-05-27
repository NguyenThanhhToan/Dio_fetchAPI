import 'package:get/get.dart';
import '../model/province.dart';
import '../service/provinceService.dart';

class ProvinceController extends GetxController{
  final provinceService = Get.find<ProvinceService>();

  final provinces = <Province>[].obs;
  var isLoading = false.obs;

  Future<void> fetchProvinces() async {
    try {
      isLoading.value = true;
      final fetchedProvinces = await provinceService.fetchProvinces();
      provinces.assignAll(fetchedProvinces);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch provinces: $e');
    } finally {
      isLoading.value = false;
    }
  }
}