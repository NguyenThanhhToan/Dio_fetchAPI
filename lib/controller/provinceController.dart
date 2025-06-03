import 'package:get/get.dart';
import '../model/response/provinceResponse.dart';
import '../service/provinceService.dart';

class ProvinceController extends GetxController{
  final ProvinceService provinceService;
  ProvinceController(this.provinceService);

  final provinces = <ProvinceResponse>[].obs;
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