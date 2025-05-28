import 'package:get/get.dart';
import '../model/district.dart';
import '../service/authService.dart';
import '../service/districtService.dart';

class DistrictController extends GetxController{
  final DistrictService districtService;
  DistrictController(this.districtService);

  final districts = <District>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is int) {
      fetchDistricts(args);
    }
  }

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
