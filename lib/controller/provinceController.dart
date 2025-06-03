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
      print(e);
      Get.snackbar('Error', 'Some thing is wrong, try again later');
    } finally {
      isLoading.value = false;
    }
  }
}