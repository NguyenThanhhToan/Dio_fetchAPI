import 'package:get/get.dart';
import '../model/district.dart';
import '../service/districtService.dart';

class DistrictController extends GetxController{
  final districtService = Get.find<DistrictService>();

  final districts = <District>[].obs;
  var isLoading = false.obs;

  Future<void> fetchDistricts(int provinceID) async {
    try{
      isLoading.value = true;
      final fetchedDistricts = await districtService.fetchDistricts(provinceID);
      districts.assignAll(fetchedDistricts);
    } catch (e){
      Get.snackbar('Error', 'Failed to fetch districts: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
